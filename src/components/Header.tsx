"use client";

import Link from "next/link";
import { useState } from "react";

const navItems = [
  { label: "Home", href: "/" },
  { label: "Learn", href: "/learn" },
  { label: "Develop", href: "/develop" },
  { label: "Roadmap", href: "/roadmap" },
];

const ecosystemProjects = [
  {
    id: "alpha",
    name: "Alpha Protocol",
    shortName: "Alpha",
    description: "Protocol Foundation - Enabling P2P Connections",
    url: "#",
    color: "#dc2626",
    layer: "Layer 0",
  },
  {
    id: "omega",
    name: "Omega Wireless",
    shortName: "Omega",
    description: "Hardware Foundation - Physical Access Points",
    url: "https://www.omegawireless.xyz",
    color: "#f97316",
    layer: "Layer 1",
  },
  {
    id: "vibertas",
    name: "Vibertas",
    shortName: "Viber",
    description: "Sovereign OS - Privacy-First Operating System",
    url: "https://vibertas-os.vercel.app",
    color: "#eab308",
    layer: "OS Layer",
  },
  {
    id: "pythia",
    name: "Pythia AI",
    shortName: "Pythia",
    description: "Emergent AI - Powered by the Ecosystem",
    url: "https://pythia-ai.xyz",
    color: "#3b82f6",
    layer: "Intelligence",
  },
  {
    id: "vibe",
    name: "VIBE Token",
    shortName: "VIBE",
    description: "Ecosystem Rewards - Value for Contributors",
    url: "https://vibetoken.xyz",
    color: "#22c55e",
    layer: "Economics",
  },
  {
    id: "spectrum",
    name: "Spectrum Galactic",
    shortName: "Spectrum",
    description: "Global Reach - Satellite Coverage Extension",
    url: "https://spectrumgalactic.xyz",
    color: "#8b5cf6",
    layer: "Connectivity",
  },
];

export default function Header() {
  const [mobileMenuOpen, setMobileMenuOpen] = useState(false);
  const [ecosystemOpen, setEcosystemOpen] = useState(false);

  return (
    <header className="fixed top-0 left-0 right-0 z-50 bg-[var(--bg-primary)]/95 backdrop-blur-sm border-b border-[var(--border-default)]">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        {/* Desktop Layout */}
        <div className="hidden md:flex items-center justify-between h-16">
          {/* Ecosystem Dropdown + Logo */}
          <div className="flex items-center gap-4">
            {/* Ecosystem Dropdown */}
            <div className="relative">
              <button
                onClick={() => setEcosystemOpen(!ecosystemOpen)}
                className="flex items-center gap-2 px-3 py-2 rounded-lg bg-[var(--bg-surface)] border border-[var(--border-default)] hover:border-[var(--gold)] transition-all"
              >
                <div className="flex items-center gap-2">
                  <div
                    className="w-2 h-2 rounded-full"
                    style={{ background: "#dc2626" }}
                  />
                  <span className="text-sm font-medium text-[var(--text-primary)]">
                    Alpha
                  </span>
                </div>
                <svg
                  className={`w-4 h-4 text-[var(--text-muted)] transition-transform ${ecosystemOpen ? "rotate-180" : ""}`}
                  fill="none"
                  stroke="currentColor"
                  viewBox="0 0 24 24"
                >
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 9l-7 7-7-7" />
                </svg>
              </button>

              {ecosystemOpen && (
                <>
                  <div className="fixed inset-0 z-40" onClick={() => setEcosystemOpen(false)} />
                  <div className="absolute top-full left-0 mt-2 w-80 bg-[var(--bg-card)] border border-[var(--border-default)] rounded-xl shadow-xl z-50 overflow-hidden">
                    <div className="p-3 border-b border-[var(--border-default)]">
                      <div className="flex items-center gap-2">
                        <div className="w-6 h-6 rounded-md bg-gradient-to-br from-[var(--gold)] to-[var(--gold-dark)] flex items-center justify-center">
                          <span className="text-xs font-bold text-[var(--bg-primary)]">SS</span>
                        </div>
                        <span className="text-sm font-semibold text-gradient-gold">Sovereign Stack</span>
                      </div>
                      <p className="text-xs text-[var(--text-muted)] mt-1">
                        A symbiotic ecosystem for digital sovereignty
                      </p>
                    </div>

                    <div className="p-2">
                      {ecosystemProjects.map((project) => (
                        <a
                          key={project.id}
                          href={project.url}
                          target={project.id === "alpha" ? "_self" : "_blank"}
                          rel="noopener noreferrer"
                          onClick={() => setEcosystemOpen(false)}
                          className={`
                            flex items-start gap-3 p-3 rounded-lg transition-all
                            ${project.id === "alpha" ? "bg-[var(--bg-surface)]" : "hover:bg-[var(--bg-surface)]"}
                          `}
                        >
                          <div
                            className="w-8 h-8 rounded-lg flex items-center justify-center flex-shrink-0 mt-0.5"
                            style={{ background: `${project.color}20` }}
                          >
                            <div
                              className="w-3 h-3 rounded-full"
                              style={{ background: project.color }}
                            />
                          </div>
                          <div className="flex-1 min-w-0">
                            <div className="flex items-center gap-2">
                              <span className="text-sm font-medium text-[var(--text-primary)]">
                                {project.name}
                              </span>
                              {project.id === "alpha" && (
                                <span className="px-1.5 py-0.5 rounded text-[10px] bg-[var(--status-success-bg)] text-[var(--status-success)]">
                                  Current
                                </span>
                              )}
                            </div>
                            <p className="text-xs text-[var(--text-muted)] mt-0.5 truncate">
                              {project.description}
                            </p>
                            <span
                              className="text-[10px] font-medium mt-1 inline-block"
                              style={{ color: project.color }}
                            >
                              {project.layer}
                            </span>
                          </div>
                          {project.id !== "alpha" && (
                            <svg
                              className="w-4 h-4 text-[var(--text-muted)] flex-shrink-0 mt-1"
                              fill="none"
                              stroke="currentColor"
                              viewBox="0 0 24 24"
                            >
                              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                            </svg>
                          )}
                        </a>
                      ))}
                    </div>

                    <div className="p-3 border-t border-[var(--border-default)] bg-[var(--bg-surface)]">
                      <a
                        href="https://okb-ventures.vercel.app"
                        target="_blank"
                        rel="noopener noreferrer"
                        className="flex items-center justify-center gap-2 text-xs text-[var(--text-muted)] hover:text-[var(--gold)] transition-colors"
                      >
                        <span>Backed by OKB Ventures</span>
                        <svg className="w-3 h-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                        </svg>
                      </a>
                    </div>
                  </div>
                </>
              )}
            </div>

            {/* Logo */}
            <Link href="/" className="flex items-center gap-3">
              <div className="w-10 h-10 rounded-lg bg-gradient-to-br from-[var(--alpha-primary)] to-[var(--alpha-accent)] flex items-center justify-center font-bold text-white text-sm">
                AP
              </div>
              <div>
                <span className="text-xl font-bold text-gradient">ALPHA PROTOCOL</span>
                <span className="text-xs block text-[var(--text-muted)]">Layer 0</span>
              </div>
            </Link>
          </div>

          {/* Desktop Navigation */}
          <nav className="flex items-center gap-8">
            {navItems.map((item) => (
              <Link
                key={item.href}
                href={item.href}
                className="text-[var(--text-secondary)] hover:text-[var(--alpha-accent)] transition-colors text-sm font-medium"
              >
                {item.label}
              </Link>
            ))}
          </nav>

          {/* CTA */}
          <div className="flex items-center gap-4">
            <Link href="/learn" className="btn-primary text-sm">
              Download
            </Link>
          </div>
        </div>

        {/* Mobile Layout */}
        <div className="flex md:hidden items-center justify-between h-16 relative">
          {/* SS Dropdown - Left */}
          <div className="relative z-10">
            <button
              onClick={() => setEcosystemOpen(!ecosystemOpen)}
              className="flex items-center gap-1.5 px-2.5 py-2 rounded-lg bg-[var(--bg-surface)] border border-[var(--border-default)] hover:border-[var(--gold)] transition-all"
            >
              <div
                className="w-2 h-2 rounded-full"
                style={{ background: "#dc2626" }}
              />
              <svg
                className={`w-3.5 h-3.5 text-[var(--text-muted)] transition-transform ${ecosystemOpen ? "rotate-180" : ""}`}
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
              >
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 9l-7 7-7-7" />
              </svg>
            </button>

            {ecosystemOpen && (
              <>
                <div className="fixed inset-0 z-40" onClick={() => setEcosystemOpen(false)} />
                <div className="absolute top-full left-0 mt-2 w-72 bg-[var(--bg-card)] border border-[var(--border-default)] rounded-xl shadow-xl z-50 overflow-hidden">
                  <div className="p-3 border-b border-[var(--border-default)]">
                    <div className="flex items-center gap-2">
                      <div className="w-6 h-6 rounded-md bg-gradient-to-br from-[var(--gold)] to-[var(--gold-dark)] flex items-center justify-center">
                        <span className="text-xs font-bold text-[var(--bg-primary)]">SS</span>
                      </div>
                      <span className="text-sm font-semibold text-gradient-gold">Sovereign Stack</span>
                    </div>
                  </div>
                  <div className="p-2 max-h-80 overflow-y-auto">
                    {ecosystemProjects.map((project) => (
                      <a
                        key={project.id}
                        href={project.url}
                        target={project.id === "alpha" ? "_self" : "_blank"}
                        rel="noopener noreferrer"
                        onClick={() => setEcosystemOpen(false)}
                        className={`flex items-center gap-3 p-2.5 rounded-lg transition-all ${project.id === "alpha" ? "bg-[var(--bg-surface)]" : "hover:bg-[var(--bg-surface)]"}`}
                      >
                        <div
                          className="w-7 h-7 rounded-lg flex items-center justify-center flex-shrink-0"
                          style={{ background: `${project.color}20` }}
                        >
                          <div className="w-2.5 h-2.5 rounded-full" style={{ background: project.color }} />
                        </div>
                        <div className="flex-1 min-w-0">
                          <div className="flex items-center gap-2">
                            <span className="text-sm font-medium text-[var(--text-primary)]">{project.shortName}</span>
                            {project.id === "alpha" && (
                              <span className="px-1.5 py-0.5 rounded text-[9px] bg-[var(--status-success-bg)] text-[var(--status-success)]">Current</span>
                            )}
                          </div>
                          <span className="text-[10px] font-medium" style={{ color: project.color }}>{project.layer}</span>
                        </div>
                      </a>
                    ))}
                  </div>
                  <div className="p-2 border-t border-[var(--border-default)] bg-[var(--bg-surface)]">
                    <a href="https://okb-ventures.vercel.app" target="_blank" rel="noopener noreferrer" className="flex items-center justify-center gap-1.5 text-xs text-[var(--text-muted)] hover:text-[var(--gold)] transition-colors py-1">
                      <span>Backed by OKB Ventures</span>
                    </a>
                  </div>
                </div>
              </>
            )}
          </div>

          {/* Logo - Center */}
          <Link href="/" className="flex items-center gap-2 hover:opacity-90 transition-opacity absolute left-1/2 -translate-x-1/2">
            <div className="w-8 h-8 rounded-lg bg-gradient-to-br from-[var(--alpha-primary)] to-[var(--alpha-accent)] flex items-center justify-center font-bold text-white text-xs">
              AP
            </div>
            <span className="text-sm font-bold text-gradient">Alpha</span>
          </Link>

          {/* Menu Button - Right */}
          <button
            onClick={() => setMobileMenuOpen(!mobileMenuOpen)}
            className="p-2 text-[var(--alpha-accent)] z-10"
          >
            {mobileMenuOpen ? (
              <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
              </svg>
            ) : (
              <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 6h16M4 12h16M4 18h16" />
              </svg>
            )}
          </button>
        </div>
      </div>

      {/* Mobile Navigation */}
      {mobileMenuOpen && (
        <div className="md:hidden bg-[var(--bg-surface)] border-t border-[var(--border-default)]">
          <nav className="px-4 py-4 space-y-2">
            {navItems.map((item) => (
              <Link
                key={item.href}
                href={item.href}
                onClick={() => setMobileMenuOpen(false)}
                className="block py-2 text-[var(--text-secondary)] hover:text-[var(--alpha-accent)] transition-colors"
              >
                {item.label}
              </Link>
            ))}
            <Link
              href="/learn"
              onClick={() => setMobileMenuOpen(false)}
              className="block btn-primary text-center mt-4"
            >
              Download
            </Link>
          </nav>
        </div>
      )}
    </header>
  );
}
