// disabling react/prop-types rule because I don't think it's necessary here. usePage() should always provide a props object, and
// with the way inertia_rails is configured it should always provie an errors field in the props

/* eslint react/prop-types: 0 */

import { usePage } from "@inertiajs/react";

export function FormErrorsDisplay() {
  const { props } = usePage();

  const errors = props.errors;
  return (
    <>
      {Array.isArray(errors) && errors.length > 0 ? (
        <div className="border-red-600 border-2 p-4 rounded-2xl bg-red-100">
          {errors.map((err) => {
            return <p key={err}>{err}</p>;
          })}
        </div>
      ) : null}
    </>
  );
}
