import { RouteProp } from "@react-navigation/native";
import { RootStackParamList } from "../../../Routes";

export interface IRoute<T extends keyof RootStackParamList> {
  route: RouteProp<RootStackParamList, T>;
}
