import {
  Keyboard,
  StyleSheet,
  Text,
  TextInput,
  TouchableWithoutFeedback,
  View,
} from "react-native";
import React, { useState } from "react";
import { ParamListBase, RouteProp } from "@react-navigation/native";
import { StackNavigationProp } from "@react-navigation/stack";
import Header from "../../../components/Header";
import Button from "../../../ui/Button";
import { RootStackParamList } from "../../../../Routes";
import AsyncStorage from "@react-native-async-storage/async-storage";

interface IPasswordEdit {
  navigation: StackNavigationProp<ParamListBase>;
}

const PasswordEdit = ({ navigation }: IPasswordEdit) => {
  const [password, setPassword] = useState<string>("");
  const [confirmPassword, setConfirmPassword] = useState<string>("");

  const verifyFields = () => {
    if (!password || !confirmPassword || password.length <= 6) return true;
    if (password === confirmPassword) return false;

    return true;
  };

  const handleNext = async () => {};

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
            <Text style={styles.title}>Senha</Text>
          </View>
          <TextInput
            focusable
            style={styles.input}
            placeholder="Senha"
            secureTextEntry={true}
            onChangeText={(text) => setPassword(text)}
            value={password}
          />
          <TextInput
            focusable
            style={styles.input}
            placeholder="Confirme a senha"
            secureTextEntry={true}
            onChangeText={(text) => setConfirmPassword(text)}
            value={confirmPassword}
          />
          <Button
            disabled={verifyFields()}
            onPress={handleNext}
            text="Salvar"
          />
        </View>
      </View>
    </TouchableWithoutFeedback>
  );
};

export default PasswordEdit;

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
