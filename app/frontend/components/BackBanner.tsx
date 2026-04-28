interface ButtonProps {
    children: React.ReactNode | React.ReactNode[];
}

export default function BackBanner({ children }: ButtonProps) {
  return (
      <div className="flex self-start">
        {children}
      </div>
  );
}
