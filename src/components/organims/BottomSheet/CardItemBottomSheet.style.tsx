import { StyleSheet } from "react-native";

export const styles = StyleSheet.create({
  card: {
    borderRadius: 10,
    borderWidth: 2,
    borderColor: "rgb(236, 236, 236)",
    marginHorizontal: 10,
    height: 70,
    alignItems: "flex-start",
    justifyContent: "center",
    paddingHorizontal: 15,
    marginBottom: 10,
    gap: 5,
  },
  title: { fontSize: 20, fontWeight: "900" },
  subtitle: { fontSize: 17, fontWeight: "300" },
});
