import React, { useState } from "react";
import { Keyboard, TouchableWithoutFeedback, StatusBar } from "react-native";
import { Button, ButtonText } from "../ui/Button";
import { ParamListBase, useNavigation } from "@react-navigation/native";
import { StackNavigationProp } from "@react-navigation/stack";
import styled from "styled-components/native"; // Importe styled-components/native

const Container = styled.View`
  flex: 1;
  justify-content: center;
  align-items: center;
`;

const FormContainer = styled.View`
  flex: 3;
  justify-content: center;
  align-items: center;
  width: 100%;
  gap: 10px;
`;

const TextContainer = styled.View`
  width: 90%;
  text-align: left;
`;

const Title = styled.Text`
  font-size: 40px;
  font-weight: 900;
  margin-bottom: 10px;
`;

const FormText = styled.Text`
  font-size: 25px;
  font-weight: 300;
  margin-bottom: 30px;
`;

const Input = styled.TextInput`
  width: 90%;
  height: 40px;
  border-color: rgb(193, 193, 193);
  border-width: 1px;
  border-radius: 5px;
  padding: 8px;
`;

const SignupContainer = styled.View`
  flex: 1;
  align-items: center;
  width: 100%;
`;

const SignupText = styled.Text`
  font-size: 18px;
  font-weight: 300;
  margin-bottom: 10px;
`;

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
      <Container>
        <FormContainer>
          <TextContainer>
            <Title>Bem vindo!</Title>
            <FormText>Faça seu login</FormText>
          </TextContainer>
          <Input
            placeholder="Username"
            onChangeText={(text) => setUsername(text)}
            value={username}
          />
          <Input
            placeholder="Senha"
            secureTextEntry={true}
            onChangeText={(text) => setPassword(text)}
            value={password}
          />
          <Button disabled={isNullFields()} onPress={handleLogin}>
            <ButtonText>Login</ButtonText>
          </Button>
        </FormContainer>
        <SignupContainer>
          <SignupText>Ainda não tem uma conta?</SignupText>
          <Button onPress={handleSignup}>
            <ButtonText>Sign-in</ButtonText>
          </Button>
        </SignupContainer>
        <StatusBar barStyle="dark-content" />
      </Container>
    </TouchableWithoutFeedback>
  );
};

export default Login;
