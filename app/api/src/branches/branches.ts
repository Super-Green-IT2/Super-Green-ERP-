export const fetchBranches = async () => {
  const res = await fetch("/api/src/branches");

  if (!res.ok) {
    throw new Error("Failed to fetch branches");
  }

  const data = await res.json();
  return data.res || [];
};
