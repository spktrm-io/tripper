import React, { useState } from "react";
import {
  Keyboard,
  TouchableWithoutFeedback,
  StatusBar,
  View,
  TextInput,
  StyleSheet,
  Text,
} from "react-native";
import Button from "../ui/Button";
import { ParamListBase, useNavigation } from "@react-navigation/native";
import { StackNavigationProp } from "@react-navigation/stack";

const Login = () => {
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");

  const { navigate } = useNavigation<StackNavigationProp<ParamListBase>>();

  const isNullFields = () => {
    if (!username) return true;
    if (!password) return true;

    return false;
  };

  const handleLogin = () => {
    navigate("Home");
  };

  const handleSignup = () => {};

  return (
    <TouchableWithoutFeedback onPress={() => Keyboard.dismiss()}>
      <View style={styles.container}>
        <View style={styles.formContainer}>
          <View style={styles.textContainer}>
            <Text style={styles.title}>Bem vindo!</Text>
            <Text style={styles.formText}>Faça seu login</Text>
          </View>
          <TextInput
            style={styles.input}
            placeholder="Username"
            onChangeText={(text) => setUsername(text)}
            value={username}
          />
          <TextInput
            style={styles.input}
            placeholder="Senha"
            secureTextEntry={true}
            onChangeText={(text) => setPassword(text)}
            value={password}
          />
          <Button
            disabled={isNullFields()}
            onPress={handleLogin}
            text="Entrar"
          />
        </View>
        <View style={styles.signupContainer}>
          <Text style={styles.signupText}>Ainda não tem uma conta?</Text>
          <Button text="Cadastrar" onPress={handleSignup} />
        </View>
        <StatusBar barStyle="dark-content" />
      </View>
    </TouchableWithoutFeedback>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center",
  },
  formContainer: {
    flex: 3,
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
  signupContainer: {
    flex: 1,
    alignItems: "center",
    width: "100%",
  },
  signupText: {
    fontSize: 18,
    fontWeight: "300",
    marginBottom: 10,
  },
});

export default Login;
