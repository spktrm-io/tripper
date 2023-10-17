import React, { useState } from "react";
import {
  Keyboard,
  TouchableWithoutFeedback,
  View,
  TextInput,
  StyleSheet,
  Text,
} from "react-native";
import Button from "../components/atoms/Button/Button";
import Header from "../components/molecules/Header/Header";
import { useAuth } from "../utils/AuthProvider";
import { isNullField } from "../utils/isNullFields";
import { INavigation } from "../interfaces/Navigation/INavigation";

const Login = ({ navigation }: INavigation) => {
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");

  const handleLogin = () => {
    save("credentials", { username, password });
    navigation.navigate("Profile");
  };

  const handleSignup = () => {
    navigation.navigate("SignUpStart");
  };

  const { save } = useAuth();

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
            disabled={isNullField([username, password])}
            onPress={handleLogin}
            text="Entrar"
          />
        </View>
        <View style={styles.signupContainer}>
          <Text style={styles.signupText}>Ainda não tem uma conta?</Text>
          <Button text="Cadastrar" onPress={handleSignup} />
        </View>
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
