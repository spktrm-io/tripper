import React, {
  createContext,
  useContext,
  useState,
  ReactNode,
  useEffect,
} from "react";
import * as SecureStore from "expo-secure-store";

export interface ICredentials {
  email?: string;
  password: string;
  username?: string;
}

interface AuthContextType {
  isLogged: boolean;
  save: (key: string, value: ICredentials) => Promise<void>;
  reset: (key: string) => Promise<void>;
  credentials: ICredentials | null;
}

const AuthContext = createContext<AuthContextType | undefined>(undefined);

export const AuthProvider: React.FC<{ children: ReactNode }> = ({
  children,
}) => {
  const getValueFor = async (key: string): Promise<ICredentials | null> => {
    try {
      const result = await SecureStore.getItemAsync(key);

      if (result) return JSON.parse(result);

      return null;
    } catch (error) {
      console.error("Error reading from SecureStore: " + error);
      return null;
    }
  };

  const [isLogged, setIsLogged] = useState<boolean>(false);
  const [credentials, setCredentials] = useState<ICredentials | null>(null);

  useEffect(() => {
    async function initialize() {
      const storedCredentials = await getValueFor("credentials");
      if (storedCredentials) {
        setIsLogged(true);
        setCredentials(storedCredentials);
      }
    }
    initialize();
  }, []);

  const save = async (key: string, value: ICredentials) => {
    try {
      await SecureStore.setItemAsync(key, JSON.stringify(value));
      setIsLogged(true);
      setCredentials(value);
    } catch (error) {
      console.error("Error saving to SecureStore: " + error);
    }
  };

  const reset = async (key: string) => {
    try {
      await SecureStore.deleteItemAsync(key);
      setIsLogged(false);
      setCredentials(null);
    } catch (error) {
      console.error("Error deleting from SecureStore: " + error);
    }
  };

  return (
    <AuthContext.Provider value={{ isLogged, save, reset, credentials }}>
      {children}
    </AuthContext.Provider>
  );
};

export const useAuth = () => {
  const context = useContext(AuthContext);
  if (context === undefined) {
    throw new Error("useAuth must be used within an AuthProvider");
  }
  return context;
};
