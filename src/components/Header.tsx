import React from "react";
import { View, StyleSheet, Text, Dimensions } from "react-native";
import Button from "../ui/Button";

interface IButtonProps {
  icon?: string;
  text?: string;
  navigation: () => void;
}

interface IHeaderProps {
  rightButtonProps?: IButtonProps;
  leftButtonProps?: IButtonProps;
  centerButtonProps?: IButtonProps;
}

const Header = ({
  rightButtonProps,
  leftButtonProps,
  centerButtonProps,
}: IHeaderProps) => {
  return (
    <View style={styles.header}>
      {leftButtonProps && (
        <Button
          icon={leftButtonProps.icon}
          text={leftButtonProps.text}
          secondary
          height={50}
          width={50}
          onPress={leftButtonProps.navigation}
          style={styles.leftButton}
        />
      )}
      {centerButtonProps && (
        <Text style={styles.text}>{centerButtonProps.text}</Text>
      )}
      {rightButtonProps && (
        <Button
          icon={rightButtonProps.icon}
          text={rightButtonProps.text}
          secondary
          height={50}
          width={50}
          onPress={rightButtonProps.navigation}
          style={styles.rightButton}
        />
      )}
    </View>
  );
};

const styles = StyleSheet.create({
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

export default Header;
