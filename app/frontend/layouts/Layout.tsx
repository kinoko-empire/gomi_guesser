import { Head } from "@inertiajs/react";

import { Flash } from "@/components/Flash";
import { FormErrorsDisplay } from "@/components/FormErrorsDisplay";

export default function Layout({ children }: { children: React.ReactNode }) {
  return (
    <>
      <Head title="Gomi guessing" />
      <header className="flex gap-1 justify-between flex-wrap items-center bg-amber-500 p-1.5">
        <a>Gomi home</a>
        <nav>Nav</nav>
      </header>
      <main className="h-[calc(100vh-36px)] w-full flex flex-col items-center p-2">
        <Flash />
        <FormErrorsDisplay />
        {children}
      </main>
    </>
  );
}
