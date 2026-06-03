import { Form } from "@inertiajs/react";

// import type { InertiaResponse } from "@/types/api";
import LinkBtn from "@/components/LinkBtn";
import BackBanner from "@/components/BackBanner";

interface Props {
  create_session_path: string;
}

export default function Login({ create_session_path }: Props) {
  return (
    <div className="flex flex-col w-full items-center gap-2">
      <BackBanner>
        <LinkBtn href="/">Back to home</LinkBtn>
      </BackBanner>
      <section className="flex flex-col gap-2">
        <Form action={create_session_path} method="post">
          <div className="flex flex-col">
            <label className="flex flex-col">
              Email:
              <input
                name="email_address"
                type="email"
                autoComplete="username"
              />
            </label>
            <label className="flex flex-col">
              Password:
              <input
                type="password"
                // minLength={12}
                maxLength={72}
                name="password"
                autoComplete="current-password"
              />
            </label>
          </div>
          <button type="submit">Submit</button>
        </Form>
      </section>
    </div>
  );
}
