import dict2xml
import xmltodict
class EGRBAC:
    def __init__(self, habac=None) -> None:
        if habac is None:
            print("No model specified, please import from file instead")
            print("Enter file name:")
            fname = input()

            with open(fname) as data_file:
                raw_data = data_file.read()
                input_data = xmltodict.parse(raw_data)
                serialised_data = input_data['egrbac']
                self.U = serialised_data['users']
                self.S = serialised_data['sessions']
                self.D = serialised_data['devices']
                self.OP = serialised_data['operations']
                self.ER = serialised_data['environment_roles']
                self.DR = serialised_data['device_roles']                
                self.SSDC = serialised_data['static_seperation_of_duty_constraints']
                self.DSDC = serialised_data['dynamic_seperation_of_duty_constraints']
                return

        # Map users to coreponding users
        self.U = habac.U.copy()

        # Map coreponding Sessions
        self.S = habac.S.copy()

        # Map Devices
        self.D = habac.D.copy()

        # Map operations
        self.OP = habac.OP.copy()

        # Map Env roles to env state
        self.ER = habac.ESA.copy()

        self.DR = list(set(habac.DA+habac.OPA))

        self.SSDC = habac.UAC.copy()
        self.DSDC = habac.SAC.copy()
    
    def export(self):
        data = {
            'users': self.U,
            'sessions': self.S,
            'operations': self.OP,
            'devices': self.D,
            'environment_roles': self.ER,
            'device_roles': self.DR,
            'static_seperation_of_duty_constraints': self.SSDC,
            'dynamic_seperation_of_duty_constraints': self.DSDC
        }
        output_data = dict2xml.dict2xml(data, wrap="egrbac")
        with open("egrbac.xml", "w") as f:
            f.write(output_data)
            f.close()



class HABAC:
    def __init__(self, current_state, egrbac=None) -> None:
        if egrbac is not None:
            # Map users to coreponding users
            self.U = egrbac.U.copy()

            # Map coreponding Sessions
            self.S = egrbac.S.copy()

            # Map Devices
            self.D = egrbac.D.copy()

            # Map operations
            self.OP = egrbac.OP.copy()

            # Map Env roles to env state
            self.ESA = egrbac.ER.copy()

            # Device roles are mapped to device and Operation attributes
            self.DA=egrbac.DR.copy()
            self.OPA=egrbac.DR.copy()

            # Subject Roles Mapped to
            self.ES = [current_state]

            # Static Seperation of Duties Constraints
            self.UAC = egrbac.SSDC

            # dynamic Seperation of duties constraints 
            self.SAC = egrbac.DSDC
            return
        

    def export(self):
        data = {
            'users': self.U,
            'sessions': self.S,
            'operations': self.OP,
            'devices': self.D,
            'environment_state_attributes': self.ESA,
            'device_attributes': self.DA,
            'operation_attributes': self.OPA,
            'user_attribute_constraints': self.UAC,
            'subject_attribute_constraints': self.SAC
        }
        output_data = dict2xml.dict2xml(data, wrap="habac")
        with open("habac.xml", "w") as f:
            f.write(output_data)
            f.close()