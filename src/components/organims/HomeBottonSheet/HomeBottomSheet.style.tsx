import { StyleSheet } from "react-native";

export const styles = StyleSheet.create({
  bottomSheetContainer: {
    flex: 1,
    backgroundColor: "#ffffff",
  },
  searchContainer: {
    flexDirection: "row",
    height: 90,
    width: "100%",
    alignItems: "flex-start",
    justifyContent: "center",
    gap: 10,
  },
  input: {
    width: "80%",
    height: 50,
    borderRadius: 100,
    padding: 15,
    backgroundColor: "rgb(232, 232, 232)",
  },
});
