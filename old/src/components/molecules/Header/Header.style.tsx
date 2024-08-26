import { Dimensions, StyleSheet } from "react-native";

export const styles = StyleSheet.create({
  header: {
    flexDirection: "row",
    alignItems: "center",
    justifyContent: "space-between",
    backgroundColor: "transparent",
    position: "absolute",
    top: 0,
    left: 0,
    right: 0,
    height: 60,
    width: "100%",
    zIndex: 1,
    flex: 1,
  },
  leftButton: {
    position: "absolute",
    top: "100%", // Ajuste a coordenada top conforme necessário
    left: "5%", // Ajuste a coordenada left conforme necessário
  },
  rightButton: {
    position: "absolute",
    top: "100%", // Ajuste a coordenada top conforme necessário
    right: "5%", // Ajuste a coordenada right conforme necessário
  },
  text: {
    fontSize: 20,
    fontWeight: "900",
    color: "rgb(29, 29, 29)",
    position: "absolute",
    top: "120%", // Centraliza verticalmente
    left: Dimensions.get("window").width / 2 - 25,
  },
});
