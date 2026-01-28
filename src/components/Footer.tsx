import Link from "next/link";

const ecosystemProjects = [
  { id: "alpha", name: "Alpha Protocol", url: "#", color: "#dc2626", current: true },
  { id: "omega", name: "Omega Wireless", url: "https://omega-wireless.vercel.app", color: "#f97316" },
  { id: "vibertas", name: "Vibertas", url: "https://vibertas-os.vercel.app", color: "#eab308" },
  { id: "vibe", name: "VIBE Token", url: "https://vibe-token.vercel.app", color: "#22c55e" },
  { id: "pythia", name: "Pythia AI", url: "https://pythia-ai-web.vercel.app", color: "#3b82f6" },
  { id: "spectrum", name: "Spectrum Galactic", url: "https://spectrum-galactic.vercel.app", color: "#8b5cf6" },
];

export default function Footer() {
  return (
    <footer className="bg-[var(--bg-secondary)] border-t border-[var(--border-default)]">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
        <div className="grid grid-cols-1 md:grid-cols-4 gap-8">
          {/* Brand */}
          <div className="md:col-span-1">
            <div className="flex items-center gap-3 mb-4">
              <div className="w-10 h-10 rounded-lg bg-gradient-to-br from-[var(--alpha-primary)] to-[var(--alpha-accent)] flex items-center justify-center font-bold text-white text-sm">
                AP
              </div>
              <div>
                <span className="text-xl font-bold text-gradient">ALPHA</span>
                <span className="text-xs block text-[var(--text-muted)]">Where The Web Begins</span>
              </div>
            </div>
            <p className="text-[var(--text-secondary)] text-sm">
              Decentralized web solution with Bitcoin incentives. Secure, private, rewarding.
            </p>
          </div>

          {/* Product */}
          <div>
            <h3 className="text-[var(--alpha-accent)] font-semibold mb-4">Product</h3>
            <ul className="space-y-2">
              <li>
                <Link href="/learn" className="text-sm text-[var(--text-muted)] hover:text-[var(--alpha-accent)] transition-colors">
                  Learn
                </Link>
              </li>
              <li>
                <Link href="/develop" className="text-sm text-[var(--text-muted)] hover:text-[var(--alpha-accent)] transition-colors">
                  Develop
                </Link>
              </li>
              <li>
                <Link href="/roadmap" className="text-sm text-[var(--text-muted)] hover:text-[var(--alpha-accent)] transition-colors">
                  Roadmap
                </Link>
              </li>
            </ul>
          </div>

          {/* Sovereign Stack */}
          <div>
            <h3 className="text-[var(--gold)] font-semibold mb-4">Sovereign Stack</h3>
            <ul className="space-y-2">
              {ecosystemProjects.map((project) => (
                <li key={project.id}>
                  {project.current ? (
                    <span className="text-sm flex items-center gap-2" style={{ color: project.color }}>
                      <span className="w-1.5 h-1.5 rounded-full" style={{ background: project.color }} />
                      {project.name} (You are here)
                    </span>
                  ) : (
                    <a
                      href={project.url}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="text-sm text-[var(--text-muted)] hover:text-[var(--gold)] transition-colors flex items-center gap-2"
                    >
                      <span className="w-1.5 h-1.5 rounded-full" style={{ background: project.color }} />
                      {project.name}
                    </a>
                  )}
                </li>
              ))}
            </ul>
          </div>

          {/* Company */}
          <div>
            <h3 className="text-[var(--text-primary)] font-semibold mb-4">Backed By</h3>
            <ul className="space-y-2">
              <li>
                <a href="https://powerclubglobal.com" target="_blank" rel="noopener noreferrer" className="text-sm text-[var(--text-muted)] hover:text-[var(--gold)] transition-colors">
                  PowerClub Global
                </a>
              </li>
              <li>
                <a href="https://okb-ventures.vercel.app" target="_blank" rel="noopener noreferrer" className="text-sm text-[var(--text-muted)] hover:text-[var(--sovereign-gold)] transition-colors">
                  OKB Ventures
                </a>
              </li>
            </ul>
          </div>
        </div>

        {/* Ecosystem Pills */}
        <div className="mt-8 pt-8 border-t border-[var(--border-default)]">
          <div className="flex flex-wrap justify-center gap-3 mb-6">
            {ecosystemProjects.map((project) => (
              <a
                key={project.id}
                href={project.url}
                target={project.current ? "_self" : "_blank"}
                rel="noopener noreferrer"
                className={`flex items-center gap-2 px-3 py-1.5 rounded-full text-xs transition-all ${
                  project.current
                    ? "bg-[var(--alpha-primary)]/10 text-[var(--alpha-accent)] border border-[var(--alpha-accent)]/30"
                    : "bg-[var(--bg-surface)] text-[var(--text-muted)] border border-[var(--border-default)] hover:border-[var(--gold)] hover:text-[var(--gold)]"
                }`}
              >
                <span className="w-2 h-2 rounded-full" style={{ background: project.color }} />
                {project.name}
              </a>
            ))}
          </div>
        </div>

        <div className="pt-6 border-t border-[var(--border-default)] flex flex-col md:flex-row justify-between items-center gap-4">
          <p className="text-[var(--text-muted)] text-sm">
            &copy; {new Date().getFullYear()} Alpha Protocol. Part of the <span className="text-[var(--gold)]">Sovereign Stack</span>.
          </p>
          <p className="text-xs text-[var(--text-muted)]">
            Backed by <a href="https://okb-ventures.vercel.app" target="_blank" rel="noopener noreferrer" className="text-[var(--gold)] hover:underline">OKB Ventures</a>
          </p>
        </div>
      </div>
    </footer>
  );
}
