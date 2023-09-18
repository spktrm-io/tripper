import React from "react";
import { View, StyleSheet } from "react-native";
import Button from "../ui/Button";
import { ParamListBase, useNavigation } from "@react-navigation/native";
import { StackNavigationProp } from "@react-navigation/stack";

const Header = () => {
  const navigation = useNavigation<StackNavigationProp<ParamListBase>>();
  return (
    <View style={styles.header}>
      <Button
        icon="road"
        secondary
        height={50}
        width={50}
        onPress={() => navigation.navigate("Roads")}
      />
      <Button
        icon="bars"
        secondary
        height={50}
        width={50}
        onPress={() => navigation.navigate("Login")}
      />
    </View>
  );
};

const styles = StyleSheet.create({
  header: {
    flexDirection: "row",
    alignItems: "flex-end",
    justifyContent: "space-between",
    backgroundColor: "transparent",
    paddingHorizontal: 16,
    paddingTop: 16,
    paddingBottom: 8,
    position: "absolute", // Posicionamento absoluto
    top: 0, // Coloca o cabeçalho no topo
    left: 0, // Alinha à esquerda
    right: 0, // Alinha à direita
    height: 130,
    width: "100%",
    zIndex: 1,
  },
});

export default Header;
