import Link from "next/link";

const decentralizedFeatures = [
  {
    icon: "hub",
    title: "DECENTRALIZED WEB NODES",
    description: "HOST PRIVATE NETWORKS AND CONNECT THE DECENTRALIZED WEB",
  },
  {
    icon: "fingerprint",
    title: "DECENTRALIZED IDENTIFIERS",
    description: "OWN AND CONTROL YOUR IDENTITIES",
  },
  {
    icon: "apps",
    title: "DECENTRALIZED APPLICATIONS",
    description: "BUILD AND DEPLOY APPS ON THE DECENTRALIZED WEB",
  },
];

const tools = [
  {
    icon: "terminal",
    title: "CLI",
    description: "Scaffold projects, deploy contracts, manage keys",
    tag: "v2.0",
  },
  {
    icon: "code",
    title: "SDKs",
    description: "TypeScript, Rust, Go, Python libraries",
    tag: "4 languages",
  },
  {
    icon: "widgets",
    title: "UI Components",
    description: "Pre-built React/Vue components",
    tag: "NEW",
    highlighted: true,
  },
  {
    icon: "search",
    title: "Explorer",
    description: "Browse transactions, blocks, addresses",
  },
  {
    icon: "dashboard",
    title: "Dashboard",
    description: "Monitor your apps and usage",
  },
  {
    icon: "science",
    title: "Testnet",
    description: "Free test tokens, instant deployment",
  },
];

const codeExamples = {
  typescript: {
    install: "npm install @alpha/sdk",
    code: `import { Alpha } from '@alpha/sdk'

const alpha = new Alpha({
  network: 'mainnet',
  apiKey: process.env.ALPHA_API_KEY
})

// Connect to the network
const node = await alpha.connect()

// Send a message
const tx = await alpha.send({
  to: 'alpha://address...',
  data: { message: 'Hello, decentralized web!' }
})

console.log('Transaction:', tx.hash)`,
  },
  rust: {
    install: "cargo add alpha-sdk",
    code: `use alpha_sdk::Alpha;

#[tokio::main]
async fn main() -> Result<()> {
    let alpha = Alpha::new()
        .network("mainnet")
        .api_key(env::var("ALPHA_API_KEY")?)
        .build()?;

    // Connect to the network
    let node = alpha.connect().await?;

    // Send a message
    let tx = alpha.send(SendRequest {
        to: "alpha://address...".into(),
        data: json!({ "message": "Hello!" }),
    }).await?;

    println!("Transaction: {}", tx.hash);
    Ok(())
}`,
  },
  go: {
    install: "go get github.com/alpha/sdk-go",
    code: `package main

import (
    "fmt"
    alpha "github.com/alpha/sdk-go"
)

func main() {
    client := alpha.New(alpha.Config{
        Network: "mainnet",
        APIKey:  os.Getenv("ALPHA_API_KEY"),
    })

    // Connect to the network
    node, _ := client.Connect()

    // Send a message
    tx, _ := client.Send(alpha.SendRequest{
        To:   "alpha://address...",
        Data: map[string]any{"message": "Hello!"},
    })

    fmt.Printf("Transaction: %s\\n", tx.Hash)
}`,
  },
  python: {
    install: "pip install alpha-sdk",
    code: `from alpha import Alpha
import os

alpha = Alpha(
    network="mainnet",
    api_key=os.environ["ALPHA_API_KEY"]
)

# Connect to the network
node = alpha.connect()

# Send a message
tx = alpha.send(
    to="alpha://address...",
    data={"message": "Hello, decentralized web!"}
)

print(f"Transaction: {tx.hash}")`,
  },
};

export default function DevelopPage() {
  return (
    <div>
      {/* Hero Section */}
      <section className="min-h-[60vh] flex items-center justify-center px-4 sm:px-6 py-20">
        <div className="max-w-4xl mx-auto text-center">
          <span className="inline-block px-4 py-2 rounded-full bg-[var(--alpha-primary)]/10 border border-[var(--alpha-primary)]/30 text-[var(--alpha-accent)] text-sm tracking-wider mb-6">
            BY BUILDERS, FOR BUILDERS
          </span>

          <h1 className="text-2xl sm:text-3xl md:text-4xl font-light text-[var(--text-primary)] tracking-widest mb-4">
            BUILD THE
          </h1>
          <h2 className="text-3xl sm:text-4xl md:text-6xl font-bold text-gradient tracking-[0.15em] mb-8">
            DECENTRALIZED WEB
          </h2>
          <p className="text-[var(--text-secondary)] text-base sm:text-lg max-w-xl mx-auto mb-10 leading-relaxed">
            Ship censorship-resistant apps in days, not months. Battle-tested SDKs, comprehensive docs, and an active community.
          </p>

          {/* CTA Buttons */}
          <div className="flex flex-wrap justify-center gap-4 mb-8">
            <Link href="#quickstart" className="btn-primary">
              Start Building
            </Link>
            <a href="#" className="btn-secondary">
              Read Docs
            </a>
            <a href="#" className="px-6 py-3 text-[var(--text-secondary)] hover:text-[var(--alpha-accent)] transition-colors">
              Join Discord
            </a>
          </div>

          <p className="flex items-center justify-center gap-2 text-sm text-[var(--text-muted)]">
            <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
            </svg>
            5 minutes to first deployment
          </p>
        </div>
      </section>

      {/* Decentralized Features Section */}
      <section className="py-20 px-4 sm:px-6 bg-[var(--bg-surface)]">
        <div className="max-w-4xl mx-auto">
          <div className="space-y-6">
            {decentralizedFeatures.map((feature, index) => (
              <div key={index} className="card p-6 md:p-8 flex items-center gap-6">
                <div className="w-16 h-16 md:w-20 md:h-20 rounded-2xl bg-[var(--alpha-primary)]/10 flex items-center justify-center flex-shrink-0">
                  <svg className="w-8 h-8 md:w-10 md:h-10 text-[var(--alpha-accent)]" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    {feature.icon === "hub" && <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M5 12h14M5 12a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v4a2 2 0 01-2 2M5 12a2 2 0 00-2 2v4a2 2 0 002 2h14a2 2 0 002-2v-4a2 2 0 00-2-2m-2-4h.01M17 16h.01" />}
                    {feature.icon === "fingerprint" && <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 11c0 3.517-1.009 6.799-2.753 9.571m-3.44-2.04l.054-.09A13.916 13.916 0 008 11a4 4 0 118 0c0 1.017-.07 2.019-.203 3m-2.118 6.844A21.88 21.88 0 0015.171 17m3.839 1.132c.645-2.266.99-4.659.99-7.132A8 8 0 008 4.07M3 15.364c.64-1.319 1-2.8 1-4.364 0-1.457.39-2.823 1.07-4" />}
                    {feature.icon === "apps" && <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 6a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2H6a2 2 0 01-2-2V6zM14 6a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2V6zM4 16a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2H6a2 2 0 01-2-2v-2zM14 16a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2v-2z" />}
                  </svg>
                </div>
                <div>
                  <h3 className="text-lg md:text-xl font-semibold text-[var(--text-primary)] tracking-wider mb-2">
                    {feature.title}
                  </h3>
                  <p className="text-[var(--text-secondary)]">
                    {feature.description}
                  </p>
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Developer Tools Section */}
      <section className="py-20 px-4 sm:px-6">
        <div className="max-w-5xl mx-auto">
          <div className="text-center mb-16">
            <h2 className="text-2xl sm:text-3xl font-light text-[var(--text-primary)] tracking-widest mb-4">
              DEVELOPER TOOLS
            </h2>
            <p className="text-[var(--text-muted)]">
              Everything you need to build, test, and deploy
            </p>
          </div>

          <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
            {tools.map((tool, index) => (
              <div
                key={index}
                className={`card p-6 ${tool.highlighted ? 'border-[var(--alpha-accent)]' : ''}`}
              >
                <div className="flex items-start justify-between mb-4">
                  <div className="w-12 h-12 rounded-xl bg-[var(--alpha-primary)]/10 flex items-center justify-center">
                    <svg className="w-6 h-6 text-[var(--alpha-accent)]" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      {tool.icon === "terminal" && <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M8 9l3 3-3 3m5 0h3M5 20h14a2 2 0 002-2V6a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" />}
                      {tool.icon === "code" && <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M10 20l4-16m4 4l4 4-4 4M6 16l-4-4 4-4" />}
                      {tool.icon === "widgets" && <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 5a1 1 0 011-1h14a1 1 0 011 1v2a1 1 0 01-1 1H5a1 1 0 01-1-1V5zM4 13a1 1 0 011-1h6a1 1 0 011 1v6a1 1 0 01-1 1H5a1 1 0 01-1-1v-6zM16 13a1 1 0 011-1h2a1 1 0 011 1v6a1 1 0 01-1 1h-2a1 1 0 01-1-1v-6z" />}
                      {tool.icon === "search" && <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />}
                      {tool.icon === "dashboard" && <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 5a1 1 0 011-1h14a1 1 0 011 1v2a1 1 0 01-1 1H5a1 1 0 01-1-1V5zM4 13a1 1 0 011-1h6a1 1 0 011 1v6a1 1 0 01-1 1H5a1 1 0 01-1-1v-6zM16 13a1 1 0 011-1h2a1 1 0 011 1v6a1 1 0 01-1 1h-2a1 1 0 01-1-1v-6z" />}
                      {tool.icon === "science" && <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19.428 15.428a2 2 0 00-1.022-.547l-2.387-.477a6 6 0 00-3.86.517l-.318.158a6 6 0 01-3.86.517L6.05 15.21a2 2 0 00-1.806.547M8 4h8l-1 1v5.172a2 2 0 00.586 1.414l5 5c1.26 1.26.367 3.414-1.415 3.414H4.828c-1.782 0-2.674-2.154-1.414-3.414l5-5A2 2 0 009 10.172V5L8 4z" />}
                    </svg>
                  </div>
                  {tool.tag && (
                    <span className={`px-2 py-1 rounded text-xs ${tool.highlighted ? 'bg-[var(--alpha-primary)]/20 text-[var(--alpha-accent)]' : 'bg-[var(--bg-surface)] text-[var(--text-muted)]'}`}>
                      {tool.tag}
                    </span>
                  )}
                </div>
                <h3 className="text-lg font-semibold text-[var(--text-primary)] tracking-wider mb-2">
                  {tool.title}
                </h3>
                <p className="text-sm text-[var(--text-secondary)]">
                  {tool.description}
                </p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Quickstart Section */}
      <section id="quickstart" className="py-20 px-4 sm:px-6 bg-[var(--bg-surface)]">
        <div className="max-w-4xl mx-auto">
          <div className="text-center mb-16">
            <h2 className="text-2xl sm:text-3xl font-light text-[var(--text-primary)] tracking-widest mb-4">
              QUICKSTART
            </h2>
            <p className="text-[var(--text-muted)]">
              Up and running in seconds
            </p>
          </div>

          {/* Code Block */}
          <div className="rounded-2xl overflow-hidden border border-[var(--border-default)]">
            {/* Tab Header */}
            <div className="bg-[#0d0d0d] p-2 flex items-center justify-between">
              <div className="flex gap-2">
                {Object.keys(codeExamples).map((lang, index) => (
                  <button
                    key={lang}
                    className={`px-4 py-2 rounded-lg text-sm ${
                      index === 0
                        ? 'bg-[var(--alpha-primary)]/20 text-[var(--alpha-accent)] border border-[var(--alpha-primary)]/50'
                        : 'text-gray-500 hover:text-gray-400'
                    }`}
                  >
                    {lang.charAt(0).toUpperCase() + lang.slice(1)}
                  </button>
                ))}
              </div>
              <button className="px-3 py-1 rounded border border-gray-700 text-gray-500 text-sm hover:border-gray-500 hover:text-gray-400 transition-colors">
                Copy
              </button>
            </div>

            {/* Install Command */}
            <div className="bg-[#1a1a1a] p-4 border-b border-[var(--border-default)]">
              <div className="flex items-center gap-3 font-mono text-sm">
                <span className="text-[var(--alpha-accent)]">$</span>
                <span className="text-white">{codeExamples.typescript.install}</span>
              </div>
            </div>

            {/* Code Content */}
            <div className="bg-[#1a1a1a] p-5">
              <pre className="font-mono text-sm text-gray-300 leading-relaxed overflow-x-auto">
                <code>{codeExamples.typescript.code}</code>
              </pre>
            </div>
          </div>
        </div>
      </section>

      {/* Community Section */}
      <section className="py-20 px-4 sm:px-6">
        <div className="max-w-4xl mx-auto text-center">
          <h2 className="text-2xl sm:text-3xl font-light text-[var(--text-primary)] tracking-widest mb-4">
            JOIN THE
          </h2>
          <h3 className="text-3xl sm:text-4xl font-bold text-gradient tracking-wider mb-8">
            COMMUNITY
          </h3>
          <p className="text-[var(--text-secondary)] max-w-xl mx-auto mb-10">
            Connect with thousands of developers building on Alpha Protocol. Get help, share projects, and shape the future of the decentralized web.
          </p>
          <div className="flex flex-wrap justify-center gap-4">
            <a href="#" className="btn-primary flex items-center gap-2">
              <svg className="w-5 h-5" fill="currentColor" viewBox="0 0 24 24">
                <path d="M20.317 4.3698a19.7913 19.7913 0 00-4.8851-1.5152.0741.0741 0 00-.0785.0371c-.211.3753-.4447.8648-.6083 1.2495-1.8447-.2762-3.68-.2762-5.4868 0-.1636-.3933-.4058-.8742-.6177-1.2495a.077.077 0 00-.0785-.037 19.7363 19.7363 0 00-4.8852 1.515.0699.0699 0 00-.0321.0277C.5334 9.0458-.319 13.5799.0992 18.0578a.0824.0824 0 00.0312.0561c2.0528 1.5076 4.0413 2.4228 5.9929 3.0294a.0777.0777 0 00.0842-.0276c.4616-.6304.8731-1.2952 1.226-1.9942a.076.076 0 00-.0416-.1057c-.6528-.2476-1.2743-.5495-1.8722-.8923a.077.077 0 01-.0076-.1277c.1258-.0943.2517-.1923.3718-.2914a.0743.0743 0 01.0776-.0105c3.9278 1.7933 8.18 1.7933 12.0614 0a.0739.0739 0 01.0785.0095c.1202.099.246.1981.3728.2924a.077.077 0 01-.0066.1276 12.2986 12.2986 0 01-1.873.8914.0766.0766 0 00-.0407.1067c.3604.698.7719 1.3628 1.225 1.9932a.076.076 0 00.0842.0286c1.961-.6067 3.9495-1.5219 6.0023-3.0294a.077.077 0 00.0313-.0552c.5004-5.177-.8382-9.6739-3.5485-13.6604a.061.061 0 00-.0312-.0286zM8.02 15.3312c-1.1825 0-2.1569-1.0857-2.1569-2.419 0-1.3332.9555-2.4189 2.157-2.4189 1.2108 0 2.1757 1.0952 2.1568 2.419 0 1.3332-.9555 2.4189-2.1569 2.4189zm7.9748 0c-1.1825 0-2.1569-1.0857-2.1569-2.419 0-1.3332.9554-2.4189 2.1569-2.4189 1.2108 0 2.1757 1.0952 2.1568 2.419 0 1.3332-.946 2.4189-2.1568 2.4189Z"/>
              </svg>
              Join Discord
            </a>
            <a href="#" className="btn-secondary flex items-center gap-2">
              <svg className="w-5 h-5" fill="currentColor" viewBox="0 0 24 24">
                <path d="M12 0c-6.626 0-12 5.373-12 12 0 5.302 3.438 9.8 8.207 11.387.599.111.793-.261.793-.577v-2.234c-3.338.726-4.033-1.416-4.033-1.416-.546-1.387-1.333-1.756-1.333-1.756-1.089-.745.083-.729.083-.729 1.205.084 1.839 1.237 1.839 1.237 1.07 1.834 2.807 1.304 3.492.997.107-.775.418-1.305.762-1.604-2.665-.305-5.467-1.334-5.467-5.931 0-1.311.469-2.381 1.236-3.221-.124-.303-.535-1.524.117-3.176 0 0 1.008-.322 3.301 1.23.957-.266 1.983-.399 3.003-.404 1.02.005 2.047.138 3.006.404 2.291-1.552 3.297-1.23 3.297-1.23.653 1.653.242 2.874.118 3.176.77.84 1.235 1.911 1.235 3.221 0 4.609-2.807 5.624-5.479 5.921.43.372.823 1.102.823 2.222v3.293c0 .319.192.694.801.576 4.765-1.589 8.199-6.086 8.199-11.386 0-6.627-5.373-12-12-12z"/>
              </svg>
              View GitHub
            </a>
          </div>
        </div>
      </section>
    </div>
  );
}
