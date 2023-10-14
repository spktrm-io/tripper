import {
  View,
  TextInput,
  Keyboard,
  TouchableWithoutFeedback,
  FlatList,
} from "react-native";
import React, { useState } from "react";
import { roadsStyles } from "./styles";
import Header from "../../components/Header";
import { ParamListBase, useNavigation } from "@react-navigation/native";
import { StackNavigationProp } from "@react-navigation/stack";
import RoadCardSearch from "../../components/RoadCardSearch";
import Button from "../../ui/Button";

interface IItemSearchProps {
  id: string;
  name: string;
  address: string;
  source: any;
}

const data: IItemSearchProps[] = [
  {
    id: "1",
    name: "Restaurante Italiano",
    address: "123 Rua da Itália, Cidade, País",
    source: require("../../../assets/patagonia.jpg"),
  },
  {
    id: "2",
    name: "Café aconchegante",
    address: "456 Rua do Café, Cidade, País",
    source: require("../../../assets/machu.jpg"),
  },
  {
    id: "3",
    name: "Parque Central",
    address: "789 Avenida do Parque, Cidade, País",
    source: require("../../../assets/patagonia.jpg"),
  },
  {
    id: "4",
    name: "Museu de Arte Moderna",
    address: "101 Avenida da Arte, Cidade, País",
    source: require("../../../assets/machu.jpg"),
  },
  {
    id: "5",
    name: "Praia Ensolarada",
    address: "500 Praia Avenue, Cidade, País",
    source: require("../../../assets/patagonia.jpg"),
  },
];

const Roads = () => {
  const [search, setSearch] = useState<string>("");
  const navigation = useNavigation<StackNavigationProp<ParamListBase>>();

  return (
    <TouchableWithoutFeedback onPress={() => Keyboard.dismiss()}>
      <View style={roadsStyles.container}>
        <Header
          rightButtonProps={{
            icon: "chevron-right",
            navigation: () => navigation.goBack(),
          }}
          centerButtonProps={{
            text: "Roads",
            navigation: () => navigation.goBack(),
          }}
        />
        <View
          style={{ flex: 1, justifyContent: "flex-start", paddingTop: "35%" }}
        >
          <View
            style={{
              flexDirection: "row",
              height: 90,
              width: "100%",
              alignItems: "flex-start",
              justifyContent: "flex-start",
              gap: 10,
            }}
          >
            <Button
              height={50}
              width={50}
              icon={"chevron-left"}
              secondary
              rounded
              onPress={() => {
                Keyboard.dismiss();
                setSearch("");
              }}
            />
            <TextInput
              style={{
                width: "80%",
                height: 50,
                borderRadius: 100,
                padding: 15,
                backgroundColor: "rgb(232, 232, 232)",
              }}
              placeholder="Pra onde deseja viajar?"
              onFocus={() => {}}
              onChangeText={(text) => setSearch(text)}
              value={search}
            />
          </View>
          <FlatList
            data={data}
            renderItem={RoadCardSearch}
            keyExtractor={(item) => item.id}
          />
        </View>
      </View>
    </TouchableWithoutFeedback>
  );
};

export default Roads;
