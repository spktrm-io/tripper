import { Text, View } from "react-native";
import React from "react";
import { Image } from "expo-image";
import Header from "../../components/molecules/Header/Header";
import { StackNavigationProp } from "@react-navigation/stack";
import { ParamListBase } from "@react-navigation/native";
import Button from "../../components/atoms/Button/Button";
import { ScrollView } from "react-native-gesture-handler";
import { useAuth } from "../../utils/AuthProvider";
import Icon from "react-native-vector-icons/FontAwesome";
import { INavigation } from "../../interfaces/Navigation/INavigation";
import { styles } from "./Profile.style";

export default function Profile({ navigation }: INavigation) {
  const { reset } = useAuth();

  const profileButtons = [
    {
      text: "Email",
      route: "EmailEdit",
      icon: "chevron-right",
    },
    {
      text: "Username",
      route: "UsernameEdit",
      icon: "chevron-right",
    },
    {
      text: "Número",
      route: "NumberEdit",
      icon: "chevron-right",
    },
    {
      text: "Senha",
      route: "PasswordEdit",
      icon: "chevron-right",
    },
  ];

  return (
    <View style={styles.container}>
      <Header
        leftButtonProps={{
          icon: "chevron-left",
          navigation: () => navigation.navigate("Home"),
        }}
      />
      <ScrollView style={styles.scrollView}>
        <View style={styles.formContainer}>
          <Text style={styles.title}>Perfil</Text>
          <Image
            source={require("../../../assets/patagonia.jpg")}
            style={styles.profileImage}
          />
          {profileButtons.map((button, index) =>
            renderProfileButton(button, navigation, index)
          )}
          <Button
            style={styles.logoutButton}
            secondary
            onPress={async () => {
              reset("credentials");
              navigation.navigate("Home");
            }}
            text="Sair"
          />
        </View>
      </ScrollView>
    </View>
  );
}

const renderProfileButton = (
  button: { text: any; route: any; icon: any },
  navigation: StackNavigationProp<ParamListBase>,
  index: React.Key | null | undefined
) => (
  <Button
    key={index}
    style={styles.profileButton}
    secondary
    onPress={() => navigation.navigate(button.route)}
    text={button.text}
  >
    <Icon name={button.icon} />
  </Button>
);
