import { StyleSheet } from "react-native";
import { SCREEN_WIDTH } from "../../../constants/window";

export const styles = StyleSheet.create({
  map: {
    flex: 1,
    width: "100%",
  },
  markerImage: {
    width: SCREEN_WIDTH * 0.07,
    height: SCREEN_WIDTH * 0.07,
  },
});
