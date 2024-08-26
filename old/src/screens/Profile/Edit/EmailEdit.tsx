import {
  Keyboard,
  StyleSheet,
  Text,
  TextInput,
  TouchableWithoutFeedback,
  View,
} from "react-native";
import React, { useState } from "react";
import Header from "../../../components/molecules/Header/Header";
import Button from "../../../components/atoms/Button/Button";
import { INavigation } from "../../../interfaces/Navigation/INavigation";
import { isNullField } from "../../../utils/isNullFields";

const EmailEdit = ({ navigation }: INavigation) => {
  const [email, setEmail] = useState("");

  const handleSave = () => {};

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
          <Button
            disabled={isNullField(email)}
            onPress={handleSave}
            text="Salvar"
          />
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
