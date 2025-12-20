// from how I understand it, the files in the "serializers" directory might have circular dependencies
// but they're only typescript types so potentially doesn't have runtime implications?

// 12/22/2025 - in /types/serializers/index.ts the file imports types from other files in the directory and re-exports them, but some
// of those types import other types from the index.ts file itself
// for example as of 12/22/2025 the index file imports types from /types/serializers/Municipality.ts and /types/serializers/Prefecture.ts
// the Prefecture.ts file imports the type for Municipality from the index.ts file, forming what I believe is a circular reference
export * from "@/types/serializers";
