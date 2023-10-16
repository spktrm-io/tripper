import {
  Keyboard,
  StyleSheet,
  Text,
  TextInput,
  TouchableWithoutFeedback,
  View,
} from "react-native";
import React, { useState } from "react";
import { ParamListBase } from "@react-navigation/native";
import { StackNavigationProp } from "@react-navigation/stack";
import Header from "../../../components/Header";
import Button from "../../../ui/Button";

interface IEmailEdit {
  navigation: StackNavigationProp<ParamListBase>;
}

const EmailEdit = ({ navigation }: IEmailEdit) => {
  const [email, setEmail] = useState("");

  const isNullField = () => {
    if (!email) return true;

    return false;
  };

  const handleNext = () => {};

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
            <Text style={styles.title}>E-mail</Text>
          </View>
          <TextInput
            focusable
            style={styles.input}
            placeholder="E-mail"
            onChangeText={(text) => setEmail(text)}
            inputMode="email"
            value={email}
          />
          <Button disabled={isNullField()} onPress={handleNext} text="Salvar" />
        </View>
      </View>
    </TouchableWithoutFeedback>
  );
};

export default EmailEdit;

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
