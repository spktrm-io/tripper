import { StyleSheet } from "react-native";
import { SCREEN_HEIGHT } from "../../../constants/window";

export const styles = StyleSheet.create({
  bottomSheetContainer: {
    height: SCREEN_HEIGHT + 120,
    width: "100%",
    backgroundColor: "white",
    position: "absolute",
    top: SCREEN_HEIGHT - 120,
    borderRadius: 25,
    zIndex: 3,
  },
  line: {
    width: 75,
    height: 4,
    backgroundColor: "grey",
    alignSelf: "center",
    marginVertical: 15,
    borderRadius: 2,
  },
});
