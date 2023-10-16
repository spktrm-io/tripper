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
import MaskInput, { Masks } from "react-native-mask-input";

interface INumberEdit {
  navigation: StackNavigationProp<ParamListBase>;
}

const NumberEdit = ({ navigation }: INumberEdit) => {
  const [number, setNumber] = useState("");

  const verifyField = () => {
    if (!number || number.length < 15) return true;

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
            <Text style={styles.title}>Número</Text>
          </View>
          <MaskInput
            focusable
            style={styles.input}
            placeholder="Número"
            inputMode="tel"
            value={number}
            maxLength={15}
            onChangeText={(unmasked: string) => setNumber(unmasked)}
            mask={Masks.BRL_PHONE}
          />
          <Button disabled={verifyField()} onPress={handleNext} text="Salvar" />
        </View>
      </View>
    </TouchableWithoutFeedback>
  );
};

export default NumberEdit;

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
