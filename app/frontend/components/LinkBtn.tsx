import { Link } from "@inertiajs/react";
import type { Method } from "@inertiajs/core";

interface ButtonProps {
    children: string | React.ReactNode | (string | React.ReactNode)[];
    href: string;
    className?: string;
    method?: Method;
    style?: 'filled' | 'link';
}

export default function LinkBtn({ children, href, className, method, style = 'filled' }: ButtonProps) {
  const styleClass = style === 'filled' ? 'bg-amber-500 hover:bg-blue-600 hover:text-white' : 'text-amber-500 underline hover:text-blue-600';
  return (
    <Link href={href} className={`px-4 py-2 ${styleClass} ${className || ''}`} method={method}>
        {children}
    </Link>
  );
}
