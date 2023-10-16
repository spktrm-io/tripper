import {
  Keyboard,
  StyleSheet,
  Text,
  TextInput,
  TouchableWithoutFeedback,
  View,
} from "react-native";
import React, { useEffect, useState } from "react";
import AsyncStorage from "@react-native-async-storage/async-storage";
import { Image } from "expo-image";
import Header from "../../components/Header";
import { StackNavigationProp } from "@react-navigation/stack";
import { ParamListBase } from "@react-navigation/native";
import Button from "../../ui/Button";
import { ScrollView } from "react-native-gesture-handler";
import { useAuth } from "../../utils/AuthProvider";
import Icon from "react-native-vector-icons/FontAwesome";

interface ICredentials {
  email?: string;
  number?: string;
  password: string;
  username: string;
}

interface IProfile {
  navigation: StackNavigationProp<ParamListBase>;
}

export default function Profile({ navigation }: IProfile) {
  const [credentials, setCredentials] = useState<ICredentials | null>(null);
  const { isLogged, login, logout } = useAuth();

  const getData = async (item: string) => {
    try {
      const jsonValue = await AsyncStorage.getItem(item);
      return jsonValue != null ? JSON.parse(jsonValue) : null;
    } catch (e) {
      console.error(e);
    }
  };

  useEffect(() => {
    const setCrendentialsAsync = async () =>
      setCredentials(await getData("credentials"));

    setCrendentialsAsync();
  }, []);

  const resetCredentials = async () => {
    try {
      await AsyncStorage.removeItem("credentials");
    } catch (e) {
      console.error(e);
    }
  };

  return (
    <View style={styles.container}>
      <Header
        leftButtonProps={{
          icon: "chevron-left",
          navigation: () => navigation.navigate("Home"),
        }}
      />
      <ScrollView style={{ width: "100%" }}>
        <View style={styles.formContainer}>
          <View style={styles.textContainer}>
            <Text style={styles.title}>Perfil</Text>
          </View>
          <Image
            source={require("../../../assets/patagonia.jpg")}
            style={{
              height: 150,
              width: 150,
              borderRadius: 100,
              marginVertical: 30,
            }}
          />

          <Button
            style={{
              flexDirection: "row",
              alignItems: "flex-start",
              justifyContent: "space-between",
            }}
            secondary
            onPress={() => navigation.navigate("EmailEdit")}
            text="Email"
          >
            <Icon name="chevron-right" />
          </Button>
          <Button
            style={{
              flexDirection: "row",
              alignItems: "flex-start",
              justifyContent: "space-between",
            }}
            secondary
            onPress={() => navigation.navigate("UsernameEdit")}
            text="Username"
          >
            <Icon name="chevron-right" />
          </Button>
          <Button
            style={{
              flexDirection: "row",
              alignItems: "flex-start",
              justifyContent: "space-between",
            }}
            secondary
            onPress={() => navigation.navigate("NumberEdit")}
            text="Número"
          >
            <Icon name="chevron-right" />
          </Button>
          <Button
            style={{
              flexDirection: "row",
              alignItems: "flex-start",
              justifyContent: "space-between",
            }}
            secondary
            onPress={() => navigation.navigate("PasswordEdit")}
            text="Senha"
          >
            <Icon name="chevron-right" />
          </Button>

          <Button
            style={{ marginTop: 100 }}
            secondary
            onPress={async () => {
              await resetCredentials();
              logout();
              navigation.navigate("Home");
            }}
            text="Sair"
          />
        </View>
      </ScrollView>
    </View>
  );
}
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
