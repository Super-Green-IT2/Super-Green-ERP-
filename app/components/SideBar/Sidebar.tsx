"use client";

import Link from "next/link";

const Sidebar = () => {
  return (
    <aside
      className="
        hidden md:flex
        fixed left-0 top-0
        h-screen w-60
        flex-col justify-between
        bg-gray-900 text-white
      "
    >
      <h2 className="p-4 text-xl font-semibold">Sidebar</h2>

      <nav>
        
      </nav>

      <Link
        href="/logout"
        className="flex items-center p-4 hover:bg-gray-700"
      >
        Logout
      </Link>
    </aside>
  );
};

export default Sidebar;
