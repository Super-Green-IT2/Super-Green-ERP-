"use client";

import { useQuery } from "@tanstack/react-query";
import { fetchBranches } from "../api/src/branches/branches";

export const useBranches = () => {
  return useQuery({
    queryKey: ["branches"],
    queryFn: fetchBranches,
    gcTime: 1000 * 60 * 3, 
  });
};
