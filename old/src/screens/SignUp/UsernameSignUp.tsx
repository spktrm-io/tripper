import {
  Keyboard,
  StyleSheet,
  Text,
  TextInput,
  TouchableWithoutFeedback,
  View,
} from "react-native";
import React, { useState } from "react";

import Header from "../../components/molecules/Header/Header";
import Button from "../../components/atoms/Button/Button";
import { INavigation } from "../../interfaces/Navigation/INavigation";
import { IRoute } from "../../interfaces/Navigation/IRoute";

interface IUsernameSignUp extends INavigation, IRoute<"UsernameSignUp"> {}

const UsernameSignUp = ({ route, navigation }: IUsernameSignUp) => {
  const [username, setUsername] = useState("");

  const isNullField = () => {
    if (!username) return true;

    return false;
  };

  const handleNext = () => {
    const email = route.params?.email;
    const number = route.params?.number;

    navigation.navigate("PasswordSignUp", { username, email, number });
  };

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
            <Text style={styles.title}>Username</Text>
          </View>
          <TextInput
            focusable
            style={styles.input}
            placeholder="Username"
            onChangeText={(text) => setUsername(text)}
            value={username}
          />
          <Button
            disabled={isNullField()}
            onPress={handleNext}
            text="Próximo"
          />
        </View>
      </View>
    </TouchableWithoutFeedback>
  );
};

export default UsernameSignUp;

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
