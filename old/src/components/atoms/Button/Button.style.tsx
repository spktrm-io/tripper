import { StyleSheet } from "react-native";

export const styles = StyleSheet.create({
  button: {
    width: "90%",
    padding: 15,
    alignItems: "center",
    justifyContent: "center",
    borderRadius: 5,
    color: "white",
    backgroundColor: "rgb(48, 131, 255)",
  },
  buttonDisabled: {
    backgroundColor: "rgb(139, 185, 255)",
  },
  buttonSecondary: {
    backgroundColor: "rgb(232, 232, 232)",
  },

  buttonContained: {
    width: "100%",
  },
  buttonRounded: {
    borderRadius: 100,
  },
  buttonIcon: {
    aspectRatio: 1,
  },
  buttonText: {
    color: "white",
    fontWeight: "800",
    fontSize: 15,
  },
  buttonTextSecondary: {
    color: "black",
  },
});
