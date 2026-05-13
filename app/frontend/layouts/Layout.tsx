import { Head, usePage, Link, Form } from "@inertiajs/react";

import { Flash } from "@/components/Flash";
import { FormErrorsDisplay } from "@/components/FormErrorsDisplay";

export default function Layout({ children }: { children: React.ReactNode }) {
  const { props } = usePage<{
    auth: { user: { user_id: number; email_address: string } };
  }>();

  return (
    <>
      <Head title="Gomi guessing" />
      <header className="flex gap-1 justify-between flex-wrap items-center bg-amber-500 p-1.5">
        <nav className="flex justify-between flex-1">
          <div>
            <Link href="/">Gomi home</Link>
          </div>
          <div className="flex gap-3">
            Nav
            {props.auth ? (
              <Form method="delete" action="/session">
                <button type="submit">Logout</button>
              </Form>
            ) : null}
          </div>
        </nav>
      </header>
      <main className="h-[calc(100vh-36px)] w-full flex flex-col items-center p-2">
        <Flash />
        <FormErrorsDisplay />
        {children}
      </main>
    </>
  );
}
