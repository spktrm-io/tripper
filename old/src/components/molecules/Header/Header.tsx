import React from "react";
import { View, Text } from "react-native";
import Button from "../../atoms/Button/Button";
import { styles } from "./Header.style";
import { IHeaderButtonProps } from "../../../interfaces/Header/IHeaderButtonProps";
import { IHeaderProps } from "../../../interfaces/Header/IHeaderProps";

const renderButton = (
  buttonProps: IHeaderButtonProps | undefined,
  position: "left" | "right"
) => {
  if (!buttonProps) return null;

  const {
    icon,
    text,
    navigation,
    style,
    buttonProps: buttonPropsInner,
  } = buttonProps;

  return (
    <Button
      icon={icon}
      text={text}
      secondary
      height={50}
      width={50}
      onPress={navigation}
      style={[
        position === "left" ? styles.leftButton : styles.rightButton,
        style,
      ]}
      {...buttonPropsInner}
    />
  );
};

const Header = ({
  rightButtonProps,
  leftButtonProps,
  centerButtonProps,
}: IHeaderProps) => {
  return (
    <View style={styles.header}>
      {renderButton(leftButtonProps, "left")}
      {centerButtonProps && (
        <Text style={styles.text}>{centerButtonProps.text}</Text>
      )}
      {renderButton(rightButtonProps, "right")}
    </View>
  );
};

export default Header;
