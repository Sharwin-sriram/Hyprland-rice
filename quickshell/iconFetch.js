function guessIcon(appId) {
  if (!appId || appId.length === 0) return "application-x-executable";
  if (iconExists(appId)) return appId;
  const lower = appId.toLowerCase();
  
  if (iconExists(lower)) return lower;
  const parts = appId.split(".");
  const last = parts[parts.length - 1].toLowerCase();
  
  if (iconExists(last)) return last;
  return "application-x-executable";
}

function iconExists(iconName) {
  if (!iconName || iconName.length === 0) return false;
  const path = Quickshell.iconPath(iconName, true);
  return path.length > 0 && !path.includes("image-missing");
}
