import { Head } from "@inertiajs/react";

export default function Layout({ children }: { children: React.ReactNode }) {
  return (
    <>
      <Head title="Gomi guessing" />
      <header className="flex gap-1 justify-between flex-wrap items-center bg-amber-500 p-1.5">
        <a>Gomi home</a>
        <nav>Nav</nav>
      </header>
      <main className="mt-0 mx-auto max-w-2xl">{children}</main>
    </>
  );
}
