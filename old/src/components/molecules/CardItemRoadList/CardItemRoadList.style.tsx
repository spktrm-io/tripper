import { StyleSheet } from "react-native";

export const styles = StyleSheet.create({
  card: {
    borderRadius: 10,
    borderWidth: 2,
    borderColor: "rgb(236, 236, 236)",
    marginHorizontal: 10,
    alignItems: "flex-start",
    justifyContent: "center",
    padding: 15,
    marginBottom: 10,
    gap: 5,
  },
  title: { fontSize: 20, fontWeight: "900" },
  subtitle: { fontSize: 17, fontWeight: "300" },
  image: {
    height: 200,
    width: "100%",
    borderRadius: 10,
    marginBottom: 10,
  },
});
