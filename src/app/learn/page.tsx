import Link from "next/link";

const features = [
  {
    title: "PEER TO PEER NETWORKING",
    description: "ENABLING DEVICES TO CONNECT DIRECTLY AND EXCHANGE DATA AS PEERS",
  },
  {
    title: "CROSS-PLATFORM SUPPORT",
    description: "EXPAND COVERAGE TO COMMON DEVICE TYPES\niOS - ANDROID - WINDOWS - MAC OS - LINUX",
  },
  {
    title: "TOKENIZED REWARDS",
    description: "INCENTIVIZE NETWORK PARTICIPATION",
  },
  {
    title: "LOCALIZED MICROGRIDS",
    description: "PRIVATE AND PUBLIC USE NETWORKS",
  },
  {
    title: "GLOBAL NETWORK",
    description: "CONNECT LOCALIZED MICROGRIDS INTO A GLOBAL DECENTRALIZED NETWORK",
  },
];

const steps = [
  {
    number: 1,
    title: "Download",
    description: "Get the installer for your platform",
    time: "1 min",
  },
  {
    number: 2,
    title: "Install",
    description: "Run the setup wizard",
    time: "2 min",
  },
  {
    number: 3,
    title: "Configure",
    description: "Set your preferences & wallet",
    time: "3 min",
  },
  {
    number: 4,
    title: "Earn",
    description: "Start earning rewards automatically",
    time: "Auto",
    highlight: true,
  },
];

const benefits = [
  {
    icon: "wallet",
    title: "EARN REWARDS",
    description: "Receive automatic token rewards for contributing bandwidth and storage to the network. Passive income from your infrastructure.",
  },
  {
    icon: "visibility",
    title: "VERIFY YOURSELF",
    description: "Don't trust third parties with your data. Run your own node and verify everything directly. True digital sovereignty.",
  },
  {
    icon: "shield",
    title: "SECURE BY DESIGN",
    description: "End-to-end encryption, isolated containers, and minimal attack surface. Your data stays yours, always.",
  },
];

const requirements = {
  minimum: [
    { label: "Operating System", value: "macOS 12+ / Windows 10+ / Ubuntu 20.04+" },
    { label: "Memory", value: "8 GB RAM" },
    { label: "Storage", value: "50 GB available (SSD recommended)" },
    { label: "Network", value: "Broadband connection (5+ Mbps)" },
  ],
  recommended: [
    { label: "Memory", value: "16 GB RAM" },
    { label: "Storage", value: "100 GB SSD" },
    { label: "Network", value: "10+ Mbps upload for better rewards" },
  ],
  ports: [
    { label: "P2P", value: "TCP/UDP 30303" },
    { label: "RPC (Optional)", value: "TCP 8545" },
  ],
};

const resources = [
  { icon: "code", label: "GitHub" },
  { icon: "docs", label: "Documentation" },
  { icon: "discord", label: "Discord" },
  { icon: "security", label: "Security Audit" },
  { icon: "bug", label: "Bug Bounty" },
];

export default function LearnPage() {
  return (
    <div>
      {/* Hero Section */}
      <section className="min-h-[60vh] flex items-center justify-center px-4 sm:px-6 py-20">
        <div className="max-w-4xl mx-auto text-center">
          <h1 className="text-2xl sm:text-3xl md:text-4xl font-light text-[var(--text-primary)] tracking-widest mb-4">
            RUN THE NETWORK
          </h1>
          <h2 className="text-3xl sm:text-4xl md:text-6xl font-bold text-gradient tracking-[0.15em] mb-8">
            OWN YOUR SOVEREIGNTY
          </h2>
          <p className="text-[var(--text-secondary)] text-base sm:text-lg max-w-xl mx-auto mb-10 leading-relaxed">
            Host an Alpha Node in minutes. Earn rewards automatically. Help build censorship-resistant infrastructure.
          </p>

          {/* Download Button */}
          <Link href="#download" className="btn-primary inline-flex items-center gap-3 mb-6">
            <span>Download for Your Platform</span>
            <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4" />
            </svg>
          </Link>

          {/* Platform Chips */}
          <div className="flex flex-wrap justify-center gap-3 mb-6">
            {["macOS", "Windows", "Linux"].map((platform) => (
              <span
                key={platform}
                className="px-4 py-2 rounded-full border border-[var(--border-default)] text-sm text-[var(--text-secondary)] hover:border-[var(--alpha-accent)] hover:text-[var(--alpha-accent)] transition-all cursor-pointer"
              >
                {platform}
              </span>
            ))}
          </div>

          {/* Trust Signals */}
          <div className="flex flex-wrap justify-center gap-6 text-sm text-[var(--text-muted)]">
            <span className="flex items-center gap-2">
              <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M10 20l4-16m4 4l4 4-4 4M6 16l-4-4 4-4" />
              </svg>
              Open Source
            </span>
            <span className="flex items-center gap-2">
              <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z" />
              </svg>
              Security Audited
            </span>
            <span className="flex items-center gap-2 text-[var(--alpha-accent)]">
              <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M13 10V3L4 14h7v7l9-11h-7z" />
              </svg>
              12,847 Active Nodes
            </span>
          </div>
        </div>
      </section>

      {/* Internet is Broken Section */}
      <section className="py-20 px-4 sm:px-6">
        <div className="max-w-3xl mx-auto text-center">
          <h2 className="text-2xl sm:text-3xl font-light text-[var(--text-primary)] tracking-widest mb-4">
            THE INTERNET IS
          </h2>
          <h3 className="text-3xl sm:text-4xl md:text-6xl font-bold text-gradient tracking-[0.3em] mb-10">
            B R O K E N
          </h3>
          <p className="text-[var(--text-secondary)] leading-relaxed">
            TODAY THE WORLD WIDE WEB IS CONTROLLED BY AN EXTREMELY CONCENTRATED GROUP OF CORPORATIONS WHO USE THEIR MONOPOLIZATION OF ACCESS TO SENSOR, SURVEIL, AND PROFIT FROM THE INDIVIDUALS WHO USE IT.
          </p>
        </div>
      </section>

      {/* Fix It Together Section */}
      <section className="py-20 px-4 sm:px-6 bg-[var(--bg-surface)]">
        <div className="max-w-4xl mx-auto">
          <div className="text-center mb-16">
            <h2 className="text-2xl sm:text-3xl font-light text-[var(--text-primary)] tracking-widest mb-4">
              TOGETHER, WE WILL
            </h2>
            <h3 className="text-3xl sm:text-4xl md:text-5xl font-bold text-gradient tracking-[0.3em]">
              F I X  I T
            </h3>
          </div>

          <div className="space-y-8">
            {features.map((feature, index) => (
              <div key={index} className="card p-6 md:p-8">
                <h4 className="text-lg md:text-xl font-semibold text-[var(--alpha-accent)] tracking-wider mb-3">
                  {feature.title}
                </h4>
                <p className="text-[var(--text-secondary)] whitespace-pre-line">
                  {feature.description}
                </p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* How It Works Section */}
      <section className="py-20 px-4 sm:px-6">
        <div className="max-w-4xl mx-auto">
          <div className="text-center mb-16">
            <h2 className="text-2xl sm:text-3xl font-light text-[var(--text-primary)] tracking-widest mb-4">
              GET STARTED IN
            </h2>
            <h3 className="text-3xl sm:text-4xl font-bold text-gradient tracking-wider">
              4 SIMPLE STEPS
            </h3>
          </div>

          <div className="grid md:grid-cols-4 gap-6">
            {steps.map((step) => (
              <div key={step.number} className="text-center">
                <div className={`w-12 h-12 rounded-full ${step.highlight ? 'bg-[var(--alpha-accent)]' : 'bg-[var(--alpha-primary)]/20'} flex items-center justify-center mx-auto mb-4`}>
                  <span className={`text-lg font-bold ${step.highlight ? 'text-white' : 'text-[var(--alpha-accent)]'}`}>
                    {step.number}
                  </span>
                </div>
                <h4 className={`text-sm font-semibold tracking-wider mb-2 ${step.highlight ? 'text-[var(--alpha-accent)]' : 'text-[var(--text-primary)]'}`}>
                  {step.title.toUpperCase()}
                </h4>
                <p className="text-sm text-[var(--text-secondary)] mb-3">
                  {step.description}
                </p>
                <span className="inline-block px-3 py-1 rounded-full bg-[var(--bg-card)] text-xs text-[var(--text-muted)]">
                  {step.time}
                </span>
              </div>
            ))}
          </div>

          <div className="text-center mt-12">
            <span className="inline-flex items-center gap-2 px-6 py-3 rounded-full bg-[var(--alpha-primary)]/10 border border-[var(--alpha-primary)]/30 text-[var(--alpha-accent)]">
              <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
              </svg>
              Running in under 10 minutes
            </span>
          </div>
        </div>
      </section>

      {/* Why Run a Node Section */}
      <section className="py-20 px-4 sm:px-6 bg-[var(--bg-surface)]">
        <div className="max-w-5xl mx-auto">
          <div className="text-center mb-16">
            <h2 className="text-2xl sm:text-3xl font-light text-[var(--text-primary)] tracking-widest">
              WHY RUN A NODE?
            </h2>
          </div>

          <div className="grid md:grid-cols-3 gap-6">
            {benefits.map((benefit, index) => (
              <div key={index} className="card p-8 text-center">
                <div className="w-16 h-16 rounded-2xl bg-[var(--alpha-primary)]/10 flex items-center justify-center mx-auto mb-6">
                  <svg className="w-8 h-8 text-[var(--alpha-accent)]" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    {benefit.icon === "wallet" && <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M3 10h18M7 15h1m4 0h1m-7 4h12a3 3 0 003-3V8a3 3 0 00-3-3H6a3 3 0 00-3 3v8a3 3 0 003 3z" />}
                    {benefit.icon === "visibility" && <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 12a3 3 0 11-6 0 3 3 0 016 0z M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />}
                    {benefit.icon === "shield" && <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z" />}
                  </svg>
                </div>
                <h3 className="text-lg font-semibold text-[var(--text-primary)] tracking-wider mb-4">
                  {benefit.title}
                </h3>
                <p className="text-[var(--text-secondary)] leading-relaxed">
                  {benefit.description}
                </p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* System Requirements Section */}
      <section id="download" className="py-20 px-4 sm:px-6">
        <div className="max-w-4xl mx-auto">
          <div className="card p-8">
            <div className="flex items-center gap-3 mb-6">
              <svg className="w-6 h-6 text-[var(--alpha-accent)]" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 3v2m6-2v2M9 19v2m6-2v2M5 9H3m2 6H3m18-6h-2m2 6h-2M7 19h10a2 2 0 002-2V7a2 2 0 00-2-2H7a2 2 0 00-2 2v10a2 2 0 002 2zM9 9h6v6H9V9z" />
              </svg>
              <h3 className="text-lg font-semibold text-[var(--text-primary)] tracking-wider">
                SYSTEM REQUIREMENTS
              </h3>
            </div>

            {/* Quick Requirements */}
            <div className="flex flex-wrap gap-3 mb-8">
              <span className="px-4 py-2 rounded-lg bg-[var(--bg-surface)] border border-[var(--border-default)] text-sm text-[var(--text-secondary)]">
                8 GB RAM
              </span>
              <span className="px-4 py-2 rounded-lg bg-[var(--bg-surface)] border border-[var(--border-default)] text-sm text-[var(--text-secondary)]">
                50 GB Storage
              </span>
              <span className="px-4 py-2 rounded-lg bg-[var(--bg-surface)] border border-[var(--border-default)] text-sm text-[var(--text-secondary)]">
                Broadband
              </span>
            </div>

            {/* Detailed Requirements */}
            <div className="space-y-6">
              <div>
                <h4 className="text-sm font-semibold text-[var(--alpha-accent)] mb-3">Minimum Requirements</h4>
                <div className="space-y-2">
                  {requirements.minimum.map((req, index) => (
                    <div key={index} className="flex gap-4 text-sm">
                      <span className="w-32 text-[var(--text-muted)]">{req.label}</span>
                      <span className="text-[var(--text-secondary)]">{req.value}</span>
                    </div>
                  ))}
                </div>
              </div>

              <div>
                <h4 className="text-sm font-semibold text-[var(--alpha-accent)] mb-3">Recommended for Optimal Performance</h4>
                <div className="space-y-2">
                  {requirements.recommended.map((req, index) => (
                    <div key={index} className="flex gap-4 text-sm">
                      <span className="w-32 text-[var(--text-muted)]">{req.label}</span>
                      <span className="text-[var(--text-secondary)]">{req.value}</span>
                    </div>
                  ))}
                </div>
              </div>

              <div>
                <h4 className="text-sm font-semibold text-[var(--alpha-accent)] mb-3">Port Requirements</h4>
                <div className="space-y-2">
                  {requirements.ports.map((req, index) => (
                    <div key={index} className="flex gap-4 text-sm">
                      <span className="w-32 text-[var(--text-muted)]">{req.label}</span>
                      <span className="text-[var(--text-secondary)]">{req.value}</span>
                    </div>
                  ))}
                </div>
              </div>
            </div>
          </div>

          {/* Resources */}
          <div className="flex flex-wrap justify-center gap-3 mt-8">
            {resources.map((resource, index) => (
              <button
                key={index}
                className="px-5 py-3 rounded-lg bg-[var(--bg-card)] border border-[var(--border-default)] text-sm text-[var(--text-primary)] hover:border-[var(--alpha-accent)] hover:text-[var(--alpha-accent)] transition-all flex items-center gap-2"
              >
                {resource.label}
              </button>
            ))}
          </div>
        </div>
      </section>

      {/* Download Section */}
      <section className="py-20 px-4 sm:px-6 bg-[var(--bg-surface)]">
        <div className="max-w-4xl mx-auto">
          <div className="card p-8 text-center">
            <h2 className="text-2xl font-semibold text-[var(--text-primary)] mb-6">
              Download Alpha Protocol
            </h2>
            <div className="grid md:grid-cols-3 gap-4">
              <a href="#" className="p-6 rounded-lg bg-[var(--bg-surface)] border border-[var(--border-default)] hover:border-[var(--alpha-accent)] transition-all">
                <p className="font-semibold text-[var(--text-primary)] mb-1">macOS</p>
                <p className="text-xs text-[var(--text-muted)]">Coming Soon</p>
              </a>
              <a href="#" className="p-6 rounded-lg bg-[var(--bg-surface)] border border-[var(--border-default)] hover:border-[var(--alpha-accent)] transition-all">
                <p className="font-semibold text-[var(--text-primary)] mb-1">Windows</p>
                <p className="text-xs text-[var(--text-muted)]">Coming Soon</p>
              </a>
              <a href="#" className="p-6 rounded-lg bg-[var(--bg-surface)] border border-[var(--border-default)] hover:border-[var(--alpha-accent)] transition-all">
                <p className="font-semibold text-[var(--text-primary)] mb-1">Linux</p>
                <p className="text-xs text-[var(--text-muted)]">Coming Soon</p>
              </a>
            </div>
          </div>
        </div>
      </section>
    </div>
  );
}
