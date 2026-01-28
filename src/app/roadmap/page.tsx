export default function RoadmapPage() {
  return (
    <div className="min-h-screen py-20 px-4 sm:px-6">
      <div className="max-w-4xl mx-auto text-center">
        <h1 className="text-4xl md:text-5xl font-bold text-gradient mb-8">Roadmap</h1>
        <p className="text-[var(--text-secondary)] text-lg mb-12">
          Our journey to building the decentralized web.
        </p>

        <div className="space-y-6 text-left">
          <div className="card p-6">
            <h3 className="text-lg font-semibold text-[var(--alpha-accent)] mb-2">Q1 2026</h3>
            <p className="text-[var(--text-secondary)]">Alpha Protocol Network launch</p>
          </div>
          <div className="card p-6">
            <h3 className="text-lg font-semibold text-[var(--text-muted)] mb-2">Q2 2026</h3>
            <p className="text-[var(--text-secondary)]">Mobile app release</p>
          </div>
          <div className="card p-6">
            <h3 className="text-lg font-semibold text-[var(--text-muted)] mb-2">Q3 2026</h3>
            <p className="text-[var(--text-secondary)]">Ecosystem expansion</p>
          </div>
        </div>
      </div>
    </div>
  );
}
