export const metadata = {
  title: 'makeonemove',
  description: 'A cross-platform app monorepo scaffold',
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  );
}
