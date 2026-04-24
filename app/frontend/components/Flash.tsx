import { usePage } from "@inertiajs/react";

// might have flash values that are not simple strings, but rather an object in the shape {type: string; message: string;}
// and want to be able to narrow it appropriately
// function isObjFlash(
//   value: unknown,
// ): value is { type: string; message: string } {
//   return (
//     typeof value == "object" &&
//     value !== null &&
//     "type" in value &&
//     typeof value.type === "string" &&
//     "message" in value &&
//     typeof value.message === "string"
//   );
// }

// by default, rails/inertia has :notice and :alert flash messages
// seems like :notice could be used for something like success messages, while :alert might be used to flash a warning or error
export function Flash() {
  const { flash } = usePage();

  const flashEntries = Object.entries(flash);

  return flashEntries.length > 0 ? (
    <div>
      {flashEntries.map(([k, v], idx) => {
        if (typeof v === "string") {
          if (k === "notice")
            return (
              <p key={idx} className="bg-green-400 p-4">
                {String(v)}
              </p>
            );
          if (k === "alert") {
            return (
              <p key={idx} className="bg-red-600 p-4">
                {String(v)}
              </p>
            );
          }
        } else {
          // only handling string flash values for now, if handling other shapes don't return null
          return null;
        }
      })}
    </div>
  ) : null;
}
