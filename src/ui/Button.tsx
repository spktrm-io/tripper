import { Text, TouchableOpacity, TouchableOpacityProps } from "react-native";
import { StyleSheet } from "react-native";

const styles = StyleSheet.create({
  button: {
    width: "90%",
    padding: 15,
    alignItems: "center",
    borderRadius: 5,
    color: "white",
    backgroundColor: "rgb(48, 131, 255)",
  },
  buttonDisabled: {
    backgroundColor: "rgb(139, 185, 255)",
  },
  buttonText: {
    color: "white",
    fontWeight: "800",
    fontSize: 15,
  },
});

interface IButtonProps extends TouchableOpacityProps {
  text: string;
}

const Button = ({ text, ...rest }: IButtonProps) => {
  return (
    <TouchableOpacity
      style={[styles.button, rest?.disabled && styles.buttonDisabled]}
      {...rest}
    >
      <Text style={styles.buttonText}>{text}</Text>
    </TouchableOpacity>
  );
};

export default Button;
