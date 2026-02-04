import Link from "next/link";

const betaProducts = [
  {
    name: "Alpha Go",
    tagline: "Mobile VPN + Rewards",
    description: "Secure mobile browsing with built-in Bitcoin rewards for your bandwidth contribution.",
    url: "#",
    color: "#dc2626",
  },
  {
    name: "Omega Wireless",
    tagline: "Hardware Mesh Nodes",
    description: "Deploy physical mesh network nodes and earn passive income.",
    url: "https://omega-wireless.vercel.app",
    color: "#f97316",
  },
  {
    name: "Spectrum Galactic",
    tagline: "Satellite Global Reach",
    description: "Global satellite connectivity bringing Alpha Protocol to every corner of Earth.",
    url: "https://spectrum-galactic.vercel.app",
    color: "#8b5cf6",
  },
];

const steps = [
  {
    step: 1,
    title: "DOWNLOAD & INSTALL",
    description: "Download and install the Alpha Protocol Network (APN) to your device",
    platforms: ["macOS", "Windows", "Linux"],
  },
  {
    step: 2,
    title: "CONFIGURE YOUR CONNECTION",
    description: "Host your own private network or connect to Alpha Protocol's decentralized network",
  },
  {
    step: 3,
    title: "SECURE & EARN",
    description: "Secure your systems and earn rewards for your contributions to the network",
    highlight: "ENJOY!",
  },
];

const networkStats = [
  {
    title: "TOTAL NETWORK NODES",
    value: "11",
    suffix: "",
    icon: "devices",
  },
  {
    title: "NETWORK BANDWIDTH",
    value: "11.11",
    suffix: "GB/S",
    icon: "speed",
  },
  {
    title: "CLOUD DATABASE",
    value: "5,000",
    suffix: "TB",
    icon: "cloud",
  },
];

export default function Home() {
  return (
    <div>
      {/* Hero Section */}
      <section className="min-h-[80vh] flex items-center justify-center px-4 sm:px-6 py-20">
        <div className="max-w-4xl mx-auto text-center">
          <h1 className="text-3xl sm:text-4xl md:text-5xl font-light text-[var(--text-primary)] tracking-widest mb-4">
            WHERE THE WEB
          </h1>
          <h2 className="text-4xl sm:text-5xl md:text-7xl font-bold text-gradient tracking-[0.2em] mb-8">
            B E G I N S
          </h2>
          <p className="text-[var(--text-secondary)] text-sm sm:text-base tracking-wider max-w-xl mx-auto mb-10 leading-relaxed">
            ALPHA PROTOCOL IS A DECENTRALIZED WEB SOLUTION WITH BITCOIN INCENTIVES
          </p>
          <Link
            href="/download"
            className="btn-primary inline-flex items-center gap-3"
          >
            <span>Download for Your Platform</span>
            <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4" />
            </svg>
          </Link>

          {/* Beta Apps */}
          <div className="mt-16 card">
            <div className="flex items-center justify-center gap-2 mb-6">
              <span className="px-3 py-1 rounded-full bg-[var(--alpha-primary)]/20 text-[var(--alpha-accent)] text-xs tracking-wider font-medium">
                BETA APPS
              </span>
            </div>
            <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
              {betaProducts.map((product) => (
                <a
                  key={product.name}
                  href={product.url}
                  target={product.url === "#" ? "_self" : "_blank"}
                  rel="noopener noreferrer"
                  className="p-5 rounded-xl bg-[var(--bg-surface)] border border-[var(--border-default)] hover:border-[var(--alpha-accent)] transition-all text-left"
                >
                  <div className="flex items-center gap-3 mb-3">
                    <div
                      className="w-10 h-10 rounded-lg flex items-center justify-center"
                      style={{ background: `${product.color}20` }}
                    >
                      <div className="w-4 h-4 rounded-full" style={{ background: product.color }} />
                    </div>
                    <div>
                      <h3 className="text-[var(--text-primary)] font-medium">{product.name}</h3>
                      <p className="text-xs" style={{ color: product.color }}>{product.tagline}</p>
                    </div>
                  </div>
                  <p className="text-sm text-[var(--text-muted)] leading-relaxed">
                    {product.description}
                  </p>
                </a>
              ))}
            </div>
          </div>
        </div>
      </section>

      {/* Safeguard Section */}
      <section className="py-20 px-4 sm:px-6 bg-[var(--bg-surface)]">
        <div className="max-w-3xl mx-auto text-center">
          <h2 className="text-2xl sm:text-3xl font-light text-[var(--text-primary)] tracking-widest mb-2">
            SAFEGUARD YOUR
          </h2>
          <h3 className="text-3xl sm:text-4xl md:text-5xl font-bold text-gradient tracking-[0.2em] mb-12">
            C O N N E C T I O N
          </h3>

          <div className="space-y-6">
            {steps.map((item) => (
              <div
                key={item.step}
                className="p-8 card text-center"
              >
                <div className="w-12 h-12 rounded-full bg-[var(--alpha-primary)]/20 flex items-center justify-center mx-auto mb-5">
                  <span className="text-xl font-bold text-[var(--alpha-accent)]">{item.step}</span>
                </div>
                <h4 className="text-lg font-semibold text-[var(--text-primary)] tracking-wider mb-3">
                  {item.title}
                </h4>
                <p className="text-[var(--text-secondary)] mb-4">
                  {item.description}
                </p>
                {item.platforms && (
                  <div className="flex items-center justify-center gap-6 mt-4">
                    {item.platforms.map((platform) => (
                      <span key={platform} className="text-xs text-[var(--text-muted)] uppercase tracking-wider">
                        {platform}
                      </span>
                    ))}
                  </div>
                )}
                {item.highlight && (
                  <p className="text-xl font-bold text-[var(--alpha-accent)] tracking-widest mt-4">
                    {item.highlight}
                  </p>
                )}
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Network Snapshot Section */}
      <section className="py-20 px-4 sm:px-6">
        <div className="max-w-5xl mx-auto">
          <div className="grid md:grid-cols-2 gap-12 items-center">
            <div>
              <h2 className="text-2xl sm:text-3xl font-light text-[var(--text-primary)] tracking-widest mb-2">
                NETWORK
              </h2>
              <h3 className="text-3xl sm:text-4xl md:text-5xl font-bold text-gradient tracking-[0.15em] mb-6">
                SNAPSHOT
              </h3>
              <p className="text-[var(--text-secondary)] mb-8">
                Real-time statistics from the Alpha Protocol decentralized network.
              </p>
              <Link href="/download" className="btn-primary">
                Download Now
              </Link>
            </div>
            <div className="grid gap-4">
              {networkStats.map((stat, index) => (
                <div key={index} className="card p-5 text-center">
                  <p className="text-xs text-[var(--text-muted)] tracking-wider mb-2">{stat.title}</p>
                  <div className="flex items-end justify-center gap-1">
                    <span className="text-3xl font-bold text-[var(--text-primary)]">{stat.value}</span>
                    {stat.suffix && (
                      <span className="text-sm text-[var(--alpha-accent)] mb-1">{stat.suffix}</span>
                    )}
                  </div>
                </div>
              ))}
            </div>
          </div>
        </div>
      </section>

      {/* VIBE Token Section */}
      <section className="py-20 px-4 sm:px-6 bg-[var(--bg-surface)]">
        <div className="max-w-4xl mx-auto">
          <div className="card p-8 sm:p-12 relative overflow-hidden">
            <div className="absolute inset-0 bg-gradient-to-br from-[#22c55e]/10 via-transparent to-[var(--alpha-primary)]/10" />

            <div className="relative z-10">
              <div className="flex items-center justify-center gap-3 mb-6">
                <div className="w-12 h-12 rounded-full bg-[#22c55e] flex items-center justify-center">
                  <span className="text-xl font-bold text-black">V</span>
                </div>
                <span className="px-3 py-1 rounded-full bg-[#22c55e]/20 text-[#22c55e] text-xs tracking-wider font-medium">
                  ECOSYSTEM TOKEN
                </span>
              </div>

              <h2 className="text-2xl sm:text-3xl font-light text-[var(--text-primary)] tracking-widest mb-2 text-center">
                TRADE
              </h2>
              <h3 className="text-3xl sm:text-4xl md:text-5xl font-bold tracking-[0.2em] mb-6 text-center text-[#22c55e]">
                VIBE TOKENS
              </h3>

              <p className="text-[var(--text-secondary)] max-w-xl mx-auto mb-8 text-center">
                VIBE is the native reward token of the Sovereign Stack ecosystem. Earn VIBE by contributing bandwidth, running nodes, and participating in the network.
              </p>

              <div className="grid grid-cols-3 gap-4 mb-8">
                <div className="p-4 rounded-xl bg-[var(--bg-surface)] border border-[var(--border-default)] text-center">
                  <p className="text-2xl font-bold text-[#22c55e]">$0.001</p>
                  <p className="text-xs text-[var(--text-muted)] uppercase tracking-wider mt-1">Current Price</p>
                </div>
                <div className="p-4 rounded-xl bg-[var(--bg-surface)] border border-[var(--border-default)] text-center">
                  <p className="text-2xl font-bold text-[var(--text-primary)]">1B</p>
                  <p className="text-xs text-[var(--text-muted)] uppercase tracking-wider mt-1">Total Supply</p>
                </div>
                <div className="p-4 rounded-xl bg-[var(--bg-surface)] border border-[var(--border-default)] text-center">
                  <p className="text-2xl font-bold text-[#22c55e]">LIVE</p>
                  <p className="text-xs text-[var(--text-muted)] uppercase tracking-wider mt-1">Status</p>
                </div>
              </div>

              <div className="flex flex-col sm:flex-row items-center justify-center gap-4">
                <a
                  href="https://vibe-token.vercel.app"
                  target="_blank"
                  rel="noopener noreferrer"
                  className="px-8 py-4 bg-[#22c55e] hover:bg-[#16a34a] rounded-xl font-semibold text-black transition-all"
                >
                  Buy VIBE Tokens
                </a>
                <a
                  href="https://vibe-token.vercel.app/tokenomics"
                  target="_blank"
                  rel="noopener noreferrer"
                  className="px-8 py-4 border border-[#22c55e]/30 rounded-xl font-semibold text-[#22c55e] hover:bg-[#22c55e]/10 transition-all"
                >
                  View Tokenomics
                </a>
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* Join Section */}
      <section className="py-20 px-4 sm:px-6">
        <div className="max-w-4xl mx-auto text-center">
          <h2 className="text-2xl sm:text-3xl font-light text-[var(--text-primary)] tracking-widest mb-2">
            JOIN THE ALPHA
          </h2>
          <h3 className="text-3xl sm:text-4xl md:text-5xl font-bold text-gradient tracking-[0.2em] mb-8">
            COMMUNITY
          </h3>
          <p className="text-[var(--text-secondary)] max-w-xl mx-auto mb-10">
            Be part of the decentralized future. Contribute to the network, earn rewards, and help build a more private and secure internet for everyone.
          </p>
          <div className="flex flex-col sm:flex-row items-center justify-center gap-4">
            <Link href="/download" className="btn-primary">
              Get Started
            </Link>
            <Link href="/develop" className="btn-secondary">
              For Developers
            </Link>
          </div>
        </div>
      </section>
    </div>
  );
}
