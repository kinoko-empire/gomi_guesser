import { Link } from "@inertiajs/react";
import type { Method } from "@inertiajs/core";

interface ButtonProps {
    children: string | React.ReactNode | (string | React.ReactNode)[];
    href: string;
    className?: string;
    method?: Method;
}

export default function LinkBtn({ children, href, className, method }: ButtonProps) {
  return (
    <Link href={href} className={`px-4 py-2 bg-amber-500 hover:bg-blue-600 hover:text-white ${className || ''}`} method={method}>
        {children}
    </Link>
  );
}
