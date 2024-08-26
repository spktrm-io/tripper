import { StyleSheet } from "react-native";

export const styles = StyleSheet.create({
  bottomSheetContainer: {
    flex: 1,
    backgroundColor: "#ffffff",
  },
  searchContainer: {
    flexDirection: "row",
    alignItems: "center",
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
  cancelButton: {
    borderRadius: 0,
    borderBottomRightRadius: 30,
    borderTopRightRadius: 30,
  },
});
