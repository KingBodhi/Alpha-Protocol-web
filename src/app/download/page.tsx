import Link from "next/link";

const installSteps = [
  {
    number: 1,
    title: "Install Prerequisites",
    description: "Set up the required tools for your platform",
    platforms: ["Linux", "macOS", "Windows"],
  },
  {
    number: 2,
    title: "Clone Repository",
    description: "Get the latest APN Core source code from GitHub",
  },
  {
    number: 3,
    title: "Build & Run",
    description: "Compile and launch your sovereign node",
  },
  {
    number: 4,
    title: "Secure Your Identity",
    description: "Save your 12-word recovery phrase and start earning VIBE",
  },
];

const binaryDownloads = [
  {
    platform: "Linux",
    icon: "🐧",
    status: "available",
    description: "Ubuntu 20.04+, Debian, and compatible distributions",
    files: [
      { name: "AppImage", size: "~70 MB", url: "/downloads/linux/APN-Core.AppImage" },
      { name: ".deb Package", size: "~45 MB", url: "/downloads/linux/apn-core.deb" },
    ],
  },
  {
    platform: "macOS",
    icon: "🍎",
    status: "coming-soon",
    description: "macOS 10.15+ (Intel & Apple Silicon)",
    files: [
      { name: "DMG", size: "~60 MB", url: "#" },
    ],
  },
  {
    platform: "Windows",
    icon: "🪟",
    status: "coming-soon",
    description: "Windows 10/11 (64-bit)",
    files: [
      { name: "Installer", size: "~50 MB", url: "#" },
    ],
  },
];

export default function DownloadPage() {
  return (
    <div>
      {/* Hero Section */}
      <section className="min-h-[60vh] flex items-center justify-center px-4 sm:px-6 py-20">
        <div className="max-w-4xl mx-auto text-center">
          <h1 className="text-3xl sm:text-4xl md:text-5xl font-light text-[var(--text-primary)] tracking-widest mb-4">
            GET APN
          </h1>
          <h2 className="text-4xl sm:text-5xl md:text-7xl font-bold text-gradient tracking-[0.2em] mb-8">
            C O R E
          </h2>
          <p className="text-[var(--text-secondary)] text-sm sm:text-base tracking-wider max-w-2xl mx-auto mb-4 leading-relaxed">
            JOIN THE ALPHA PROTOCOL NETWORK - CONTRIBUTE COMPUTE, EARN VIBE TOKENS
          </p>

          <div className="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-[var(--alpha-primary)]/20 text-[var(--alpha-accent)] text-xs tracking-wider mb-10">
            <span className="w-2 h-2 rounded-full bg-[var(--alpha-accent)] animate-pulse"></span>
            VERSION 0.1.0 ALPHA
          </div>

          <div className="flex flex-col sm:flex-row items-center justify-center gap-4 mt-10">
            <a
              href="#github-install"
              className="btn-primary inline-flex items-center gap-3"
            >
              <span>Install from GitHub</span>
              <svg className="w-5 h-5" fill="currentColor" viewBox="0 0 24 24">
                <path d="M12 0C5.37 0 0 5.37 0 12c0 5.31 3.435 9.795 8.205 11.385.6.105.825-.255.825-.57 0-.285-.015-1.23-.015-2.235-3.015.555-3.795-.735-4.035-1.41-.135-.345-.72-1.41-1.23-1.695-.42-.225-1.02-.78-.015-.795.945-.015 1.62.87 1.845 1.23 1.08 1.815 2.805 1.305 3.495.99.105-.78.42-1.305.765-1.605-2.67-.3-5.46-1.335-5.46-5.925 0-1.305.465-2.385 1.23-3.225-.12-.3-.54-1.53.12-3.18 0 0 1.005-.315 3.3 1.23.96-.27 1.98-.405 3-.405s2.04.135 3 .405c2.295-1.56 3.3-1.23 3.3-1.23.66 1.65.24 2.88.12 3.18.765.84 1.23 1.905 1.23 3.225 0 4.605-2.805 5.625-5.475 5.925.435.375.81 1.095.81 2.22 0 1.605-.015 2.895-.015 3.3 0 .315.225.69.825.57A12.02 12.02 0 0024 12c0-6.63-5.37-12-12-12z"/>
              </svg>
            </a>
            <a
              href="#binary-downloads"
              className="btn-secondary inline-flex items-center gap-2"
            >
              <span>Download Binary</span>
              <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4" />
              </svg>
            </a>
          </div>
        </div>
      </section>

      {/* GitHub Installation */}
      <section id="github-install" className="py-20 px-4 sm:px-6 bg-[var(--bg-surface)]">
        <div className="max-w-5xl mx-auto">
          <div className="text-center mb-12">
            <h2 className="text-2xl sm:text-3xl font-light text-[var(--text-primary)] tracking-widest mb-2">
              INSTALL FROM
            </h2>
            <h3 className="text-3xl sm:text-4xl md:text-5xl font-bold text-gradient tracking-[0.2em] mb-4">
              G I T H U B
            </h3>
            <p className="text-[var(--text-secondary)] max-w-2xl mx-auto">
              Build from source for the latest features and full control
            </p>
          </div>

          <div className="grid gap-6">
            {installSteps.map((step) => (
              <div key={step.number} className="card">
                <div className="flex items-start gap-4">
                  <div className="w-12 h-12 rounded-full bg-[var(--alpha-primary)]/20 flex items-center justify-center flex-shrink-0">
                    <span className="text-xl font-bold text-[var(--alpha-accent)]">{step.number}</span>
                  </div>
                  <div className="flex-1">
                    <h4 className="text-lg font-semibold text-[var(--text-primary)] tracking-wider mb-2">
                      {step.title}
                    </h4>
                    <p className="text-[var(--text-secondary)] mb-4">
                      {step.description}
                    </p>
                    {step.platforms && (
                      <div className="flex flex-wrap gap-2">
                        {step.platforms.map((platform) => (
                          <span key={platform} className="px-3 py-1 rounded-full bg-[var(--bg-surface)] text-xs text-[var(--text-muted)] uppercase tracking-wider">
                            {platform}
                          </span>
                        ))}
                      </div>
                    )}
                  </div>
                </div>
              </div>
            ))}
          </div>

          {/* GitHub Link */}
          <div className="mt-10 text-center">
            <a
              href="https://github.com/KingBodhi/pcg-cc-mcp"
              target="_blank"
              rel="noopener noreferrer"
              className="inline-flex items-center gap-3 px-8 py-4 bg-[var(--bg-card)] border border-[var(--border-default)] hover:border-[var(--alpha-accent)] rounded-xl transition-all"
            >
              <svg className="w-6 h-6 text-[var(--text-primary)]" fill="currentColor" viewBox="0 0 24 24">
                <path d="M12 0C5.37 0 0 5.37 0 12c0 5.31 3.435 9.795 8.205 11.385.6.105.825-.255.825-.57 0-.285-.015-1.23-.015-2.235-3.015.555-3.795-.735-4.035-1.41-.135-.345-.72-1.41-1.23-1.695-.42-.225-1.02-.78-.015-.795.945-.015 1.62.87 1.845 1.23 1.08 1.815 2.805 1.305 3.495.99.105-.78.42-1.305.765-1.605-2.67-.3-5.46-1.335-5.46-5.925 0-1.305.465-2.385 1.23-3.225-.12-.3-.54-1.53.12-3.18 0 0 1.005-.315 3.3 1.23.96-.27 1.98-.405 3-.405s2.04.135 3 .405c2.295-1.56 3.3-1.23 3.3-1.23.66 1.65.24 2.88.12 3.18.765.84 1.23 1.905 1.23 3.225 0 4.605-2.805 5.625-5.475 5.925.435.375.81 1.095.81 2.22 0 1.605-.015 2.895-.015 3.3 0 .315.225.69.825.57A12.02 12.02 0 0024 12c0-6.63-5.37-12-12-12z"/>
              </svg>
              <div className="text-left">
                <div className="text-sm font-semibold text-[var(--text-primary)]">View on GitHub</div>
                <div className="text-xs text-[var(--text-muted)]">Full installation instructions</div>
              </div>
              <svg className="w-5 h-5 text-[var(--text-muted)]" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
              </svg>
            </a>
          </div>
        </div>
      </section>

      {/* Binary Downloads */}
      <section id="binary-downloads" className="py-20 px-4 sm:px-6">
        <div className="max-w-5xl mx-auto">
          <div className="text-center mb-12">
            <h2 className="text-2xl sm:text-3xl font-light text-[var(--text-primary)] tracking-widest mb-2">
              DOWNLOAD
            </h2>
            <h3 className="text-3xl sm:text-4xl md:text-5xl font-bold text-gradient tracking-[0.2em] mb-4">
              B I N A R I E S
            </h3>
            <p className="text-[var(--text-secondary)] max-w-2xl mx-auto">
              Pre-built installers for quick setup
            </p>
          </div>

          <div className="grid md:grid-cols-3 gap-6">
            {binaryDownloads.map((download) => (
              <div
                key={download.platform}
                className={`card text-center ${download.status === 'coming-soon' ? 'opacity-60' : ''}`}
              >
                <div className="text-5xl mb-4">{download.icon}</div>
                <h4 className="text-xl font-semibold text-[var(--text-primary)] mb-2">
                  {download.platform}
                </h4>
                <div className="mb-4">
                  {download.status === 'available' ? (
                    <span className="px-3 py-1 rounded-full bg-[var(--status-success-bg)] text-[var(--status-success)] text-xs tracking-wider font-medium">
                      AVAILABLE
                    </span>
                  ) : (
                    <span className="px-3 py-1 rounded-full bg-[var(--alpha-primary)]/20 text-[var(--text-muted)] text-xs tracking-wider font-medium">
                      COMING SOON
                    </span>
                  )}
                </div>
                <p className="text-sm text-[var(--text-secondary)] mb-6">
                  {download.description}
                </p>
                <div className="space-y-3">
                  {download.files.map((file) => (
                    <a
                      key={file.name}
                      href={file.url}
                      className={`block btn-primary text-sm ${download.status === 'coming-soon' ? 'pointer-events-none opacity-50' : ''}`}
                    >
                      {file.name} <span className="text-xs opacity-75">({file.size})</span>
                    </a>
                  ))}
                </div>
              </div>
            ))}
          </div>

          {/* Info Box */}
          <div className="mt-12 card bg-[var(--alpha-primary)]/10 border-[var(--alpha-accent)]">
            <div className="flex items-start gap-4">
              <svg className="w-6 h-6 text-[var(--alpha-accent)] flex-shrink-0 mt-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
              </svg>
              <div>
                <h4 className="font-semibold text-[var(--text-primary)] mb-2">Binary Downloads In Progress</h4>
                <p className="text-[var(--text-secondary)] text-sm leading-relaxed">
                  We're preparing installers for all platforms. In the meantime, install from GitHub above for immediate access to APN Core.
                </p>
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* What You Get Section */}
      <section className="py-20 px-4 sm:px-6 bg-[var(--bg-surface)]">
        <div className="max-w-4xl mx-auto">
          <div className="text-center mb-12">
            <h2 className="text-2xl sm:text-3xl font-light text-[var(--text-primary)] tracking-widest mb-2">
              WHAT YOU
            </h2>
            <h3 className="text-3xl sm:text-4xl md:text-5xl font-bold text-gradient tracking-[0.2em] mb-8">
              G E T
            </h3>
          </div>

          <div className="grid sm:grid-cols-2 gap-6">
            <div className="card">
              <div className="text-3xl mb-4">💰</div>
              <h4 className="text-lg font-semibold text-[var(--text-primary)] mb-2">Earn VIBE Tokens</h4>
              <p className="text-[var(--text-secondary)] text-sm">
                Contribute compute power and earn VIBE tokens passively
              </p>
            </div>

            <div className="card">
              <div className="text-3xl mb-4">🔒</div>
              <h4 className="text-lg font-semibold text-[var(--text-primary)] mb-2">Sovereign Identity</h4>
              <p className="text-[var(--text-secondary)] text-sm">
                Ed25519 keypair with BIP39 recovery phrase
              </p>
            </div>

            <div className="card">
              <div className="text-3xl mb-4">⚡</div>
              <h4 className="text-lg font-semibold text-[var(--text-primary)] mb-2">Auto-Start</h4>
              <p className="text-[var(--text-secondary)] text-sm">
                Runs in the background on system startup
              </p>
            </div>

            <div className="card">
              <div className="text-3xl mb-4">🌐</div>
              <h4 className="text-lg font-semibold text-[var(--text-primary)] mb-2">Mesh Network</h4>
              <p className="text-[var(--text-secondary)] text-sm">
                LibP2P-based peer-to-peer connectivity
              </p>
            </div>
          </div>
        </div>
      </section>

      {/* CTA Section */}
      <section className="py-20 px-4 sm:px-6">
        <div className="max-w-4xl mx-auto text-center">
          <h2 className="text-2xl sm:text-3xl font-light text-[var(--text-primary)] tracking-widest mb-2">
            READY TO
          </h2>
          <h3 className="text-3xl sm:text-4xl md:text-5xl font-bold text-gradient tracking-[0.2em] mb-8">
            C O N T R I B U T E ?
          </h3>
          <p className="text-[var(--text-secondary)] max-w-xl mx-auto mb-10 leading-relaxed">
            Join the Alpha Protocol Network today. Install APN Core, contribute your resources, and start earning VIBE tokens.
          </p>
          <div className="flex flex-col sm:flex-row items-center justify-center gap-4">
            <a href="#github-install" className="btn-primary">
              Get Started Now
            </a>
            <Link href="/learn" className="btn-secondary">
              Learn More
            </Link>
          </div>
        </div>
      </section>
    </div>
  );
}
