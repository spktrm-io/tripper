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
  description: string;
}

const data: IItemSearchProps[] = [
  {
    id: "1",
    name: "Restaurante Italiano",
    address: "123 Rua da Itália, Cidade, País",
    source: require("../../../assets/patagonia.jpg"),
    description:
      "Um restaurante italiano renomado que oferece uma ampla variedade de pratos autênticos, incluindo massas, pizzas e vinhos italianos. Desfrute de uma refeição deliciosa em um ambiente acolhedor e aconchegante.",
  },
  {
    id: "2",
    name: "Café aconchegante",
    address: "456 Rua do Café, Cidade, País",
    source: require("../../../assets/machu.jpg"),
    description:
      "Um café aconchegante onde você pode relaxar com uma xícara de café quente e uma seleção de bolos frescos. O ambiente é perfeito para ler um livro ou encontrar amigos.",
  },
  {
    id: "3",
    name: "Parque Central",
    address: "789 Avenida do Parque, Cidade, País",
    source: require("../../../assets/patagonia.jpg"),
    description:
      "O Parque Central é um local ideal para atividades ao ar livre, como piqueniques, caminhadas e jogos. Desfrute da natureza e relaxe em um ambiente verde no coração da cidade.",
  },
  {
    id: "4",
    name: "Museu de Arte Moderna",
    address: "101 Avenida da Arte, Cidade, País",
    source: require("../../../assets/machu.jpg"),
    description:
      "O Museu de Arte Moderna abriga uma coleção impressionante de obras de arte contemporânea de artistas renomados. Explore exposições fascinantes e mergulhe no mundo da arte moderna.",
  },
  {
    id: "5",
    name: "Praia Ensolarada",
    address: "500 Praia Avenue, Cidade, País",
    source: require("../../../assets/patagonia.jpg"),
    description:
      "Uma praia deslumbrante com areias douradas e águas cristalinas. A Praia Ensolarada é perfeita para tomar sol, nadar e praticar esportes aquáticos. Relaxe e desfrute do sol radiante.",
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
            renderItem={({ item }) => (
              <RoadCardSearch item={item} navigation={navigation} />
            )}
            keyExtractor={(item) => item.id}
          />
        </View>
      </View>
    </TouchableWithoutFeedback>
  );
};

export default Roads;
