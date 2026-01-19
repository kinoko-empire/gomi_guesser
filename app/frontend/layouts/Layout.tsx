export default function Layout({ children }: { children: React.ReactNode }) {
  return (
    <>
      <header className="flex gap-1 justify-between flex-wrap items-center bg-amber-500 p-1.5">
        <a>Gomi home</a>
        <nav>Nav</nav>
      </header>
      <main className="bg-blue-500 mt-0 mx-auto max-w-2xl">{children}</main>
    </>
  );
}
