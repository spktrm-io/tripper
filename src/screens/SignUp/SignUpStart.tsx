import {
  Keyboard,
  StyleSheet,
  Text,
  TouchableWithoutFeedback,
  View,
} from "react-native";
import React from "react";
import { ParamListBase } from "@react-navigation/native";
import { StackNavigationProp } from "@react-navigation/stack";
import Header from "../../components/Header";
import Button from "../../ui/Button";

interface ISignUpStartSignUp {
  navigation: StackNavigationProp<ParamListBase>;
}

const SignUpStart = ({ navigation }: ISignUpStartSignUp) => {
  return (
    <TouchableWithoutFeedback onPress={() => Keyboard.dismiss()}>
      <View style={styles.container}>
        <Header
          leftButtonProps={{
            icon: "chevron-left",
            navigation: () => navigation.goBack(),
          }}
        />
        <View style={styles.formContainer}>
          <View style={styles.textContainer}>
            <Text style={styles.title}>Cadastro</Text>
            <Text style={styles.formText}>Escolha a forma de login</Text>
          </View>
          <Button
            onPress={() => navigation.navigate("NumberSignUp")}
            text="Número de celular"
          />
          <Button
            onPress={() => navigation.navigate("EmailSignUp")}
            text="E-mail"
          />
        </View>
      </View>
    </TouchableWithoutFeedback>
  );
};

export default SignUpStart;

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: "flex-start",
    alignItems: "flex-start",
    paddingTop: "30%",
  },
  formContainer: {
    justifyContent: "center",
    alignItems: "center",
    width: "100%",
    marginBottom: 10,
    gap: 10,
  },
  textContainer: {
    width: "90%",
    textAlign: "left",
  },
  title: {
    fontSize: 40,
    fontWeight: "900",
    marginBottom: 10,
  },
  formText: {
    fontSize: 25,
    fontWeight: "300",
    marginBottom: 30,
  },
  input: {
    width: "90%",
    height: 40,
    borderColor: "rgb(193, 193, 193)",
    borderWidth: 1,
    borderRadius: 5,
    padding: 8,
  },
});
