import { StyleSheet } from "react-native";

export const styles = StyleSheet.create({
  bottomSheetContainer: {
    flex: 1,
    backgroundColor: "#ffffff",
    gap: 45,
  },
  searchContainer: {
    flexDirection: "row",
    height: 90,
    width: "100%",
    alignItems: "flex-start",
    justifyContent: "center",
  },
  input: {
    width: "80%",
    height: 50,
    borderTopLeftRadius: 30,
    borderBottomLeftRadius: 30,
    padding: 15,
    backgroundColor: "rgb(232, 232, 232)",
  },
});
