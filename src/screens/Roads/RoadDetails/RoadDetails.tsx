import { StyleSheet, Text, View } from "react-native";
import React from "react";
import { ParamListBase, RouteProp } from "@react-navigation/native";
import { RootStackParamList } from "../../../../Routes";
import { StackNavigationProp } from "@react-navigation/stack";
import Header from "../../../components/Header";
import { Image } from "expo-image";

interface IRoadsDetails {
  route: RouteProp<RootStackParamList, "RoadDetails">;
  navigation: StackNavigationProp<ParamListBase>;
}

export default function RoadsDetails({ route, navigation }: IRoadsDetails) {
  const { name, source, address, description, id } = route.params;

  return (
    <View style={{ flex: 1 }}>
      <Header
        rightButtonProps={{
          icon: "chevron-right",
          navigation: () => navigation.goBack(),
          buttonProps: { rounded: true },
        }}
      />
      <View style={itemSearchStyles.card}>
        <Image
          source={source}
          style={{
            height: 400,
            width: "100%",
          }}
          priority="high"
        />
        <View style={{ marginHorizontal: 10, gap: 10 }}>
          <Text style={itemSearchStyles.title}>{name}</Text>
          <Text style={itemSearchStyles.subtitle}>{address}</Text>
          <Text style={itemSearchStyles.subtitle}>{description}</Text>
        </View>
      </View>
    </View>
  );
}

const itemSearchStyles = StyleSheet.create({
  card: {
    alignItems: "flex-start",
    justifyContent: "flex-start",
    gap: 20,
    flex: 1,
  },
  title: { fontSize: 30, fontWeight: "900" },
  subtitle: { fontSize: 17, fontWeight: "300" },
});
