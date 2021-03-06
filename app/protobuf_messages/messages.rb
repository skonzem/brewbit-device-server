## Generated from bbmt.proto for 
require "beefcake"

module ProtobufMessages

  class ServerTime
    include Beefcake::Message
  end

  class ActivationTokenRequest
    include Beefcake::Message
  end

  class ActivationTokenResponse
    include Beefcake::Message
  end

  class ActivationNotification
    include Beefcake::Message
  end

  class AuthRequest
    include Beefcake::Message
  end

  class AuthResponse
    include Beefcake::Message
  end

  class OutputStatus
    include Beefcake::Message
  end

  class ControllerReport
    include Beefcake::Message
  end

  class DeviceReport
    include Beefcake::Message
  end

  class Error
    include Beefcake::Message
  end

  class FirmwareUpdateCheckRequest
    include Beefcake::Message
  end

  class FirmwareUpdateCheckResponse
    include Beefcake::Message
  end

  class FirmwareDownloadRequest
    include Beefcake::Message
  end

  class FirmwareDownloadResponse
    include Beefcake::Message
  end

  class DeviceSettings
    include Beefcake::Message

    module ControlMode
      ON_OFF = 0
      PID = 1
    end
  end

  class TempProfileStep
    include Beefcake::Message

    module TempProfileStepType
      HOLD = 0
      RAMP = 1
    end
  end

  class TempProfile
    include Beefcake::Message
  end

  class OutputSettings
    include Beefcake::Message

    module Function
      HEATING = 0
      COOLING = 1
      MANUAL = 2
    end
  end

  class ControllerSettings
    include Beefcake::Message

    module SetpointType
      STATIC = 0
      TEMP_PROFILE = 1
    end

    module CompletionAction
      HOLD_LAST = 0
      START_OVER = 1
    end

    module SessionAction
      CREATE_SESSION = 0
      EDIT_SESSION = 1
    end
  end

  class ApiMessage
    include Beefcake::Message

    module Type
      ACTIVATION_TOKEN_REQUEST = 1
      ACTIVATION_TOKEN_RESPONSE = 2
      ACTIVATION_NOTIFICATION = 3
      AUTH_REQUEST = 4
      AUTH_RESPONSE = 5
      DEVICE_REPORT = 6
      ERROR = 7
      FIRMWARE_UPDATE_CHECK_REQUEST = 8
      FIRMWARE_UPDATE_CHECK_RESPONSE = 9
      FIRMWARE_DOWNLOAD_REQUEST = 10
      FIRMWARE_DOWNLOAD_RESPONSE = 11
      DEVICE_SETTINGS = 12
      CONTROLLER_SETTINGS = 13
      SERVER_TIME = 14
    end
  end

  class ServerTime
    required :timestamp, :int32, 1
  end


  class ActivationTokenRequest
    required :device_id, :string, 1
  end


  class ActivationTokenResponse
    optional :activation_token, :string, 1
  end


  class ActivationNotification
    required :auth_token, :string, 1
  end


  class AuthRequest
    required :device_id, :string, 1
    required :auth_token, :string, 2
    optional :firmware_version, :string, 3
  end


  class AuthResponse
    required :authenticated, :bool, 1
  end


  class OutputStatus
    optional :output_index, :uint32, 1
    optional :status, :bool, 2
    optional :kp, :float, 3
    optional :ki, :float, 4
    optional :kd, :float, 5
  end


  class ControllerReport
    required :controller_index, :uint32, 1
    required :sensor_reading, :float, 2
    required :setpoint, :float, 3
    optional :timestamp, :uint32, 4
    repeated :output_status, OutputStatus, 5
  end


  class DeviceReport
    repeated :controller_reports, ControllerReport, 1
  end


  class Error
    required :code, :uint32, 1
    required :body, :string, 2
  end


  class FirmwareUpdateCheckRequest
    required :current_version, :string, 1
  end


  class FirmwareUpdateCheckResponse
    required :update_available, :bool, 1
    optional :version, :string, 2
    optional :binary_size, :uint32, 3
  end


  class FirmwareDownloadRequest
    required :requested_version, :string, 1
    required :offset, :uint32, 2
    required :size, :uint32, 3
  end


  class FirmwareDownloadResponse
    required :offset, :uint32, 1
    required :data, :bytes, 2
  end


  class DeviceSettings
    required :name, :string, 1
    required :control_mode, DeviceSettings::ControlMode, 2
    required :hysteresis, :float, 3
  end


  class TempProfileStep
    required :duration, :uint32, 1
    required :value, :float, 2
    required :type, TempProfileStep::TempProfileStepType, 3
  end


  class TempProfile
    required :id, :uint32, 1
    required :name, :string, 2
    required :start_value, :float, 3
    repeated :steps, TempProfileStep, 4
  end


  class OutputSettings
    required :index, :uint32, 1
    required :function, OutputSettings::Function, 2
    required :cycle_delay, :uint32, 3
  end


  class ControllerSettings
    required :name, :string, 1
    optional :session_action, ControllerSettings::SessionAction, 10
    required :sensor_index, :uint32, 2
    required :setpoint_type, ControllerSettings::SetpointType, 3
    optional :static_setpoint, :float, 4
    optional :temp_profile_id, :uint32, 5
    optional :temp_profile_start_point, :int32, 8
    optional :temp_profile_completion_action, ControllerSettings::CompletionAction, 9
    repeated :output_settings, OutputSettings, 6
    repeated :temp_profiles, TempProfile, 7
  end


  class ApiMessage
    required :type, ApiMessage::Type, 1
    optional :activationTokenRequest, ActivationTokenRequest, 2
    optional :activationTokenResponse, ActivationTokenResponse, 3
    optional :activationNotification, ActivationNotification, 4
    optional :authRequest, AuthRequest, 5
    optional :authResponse, AuthResponse, 6
    optional :deviceReport, DeviceReport, 7
    optional :error, Error, 8
    optional :firmwareUpdateCheckRequest, FirmwareUpdateCheckRequest, 9
    optional :firmwareUpdateCheckResponse, FirmwareUpdateCheckResponse, 10
    optional :firmwareDownloadRequest, FirmwareDownloadRequest, 11
    optional :firmwareDownloadResponse, FirmwareDownloadResponse, 12
    optional :deviceSettings, DeviceSettings, 13
    optional :controllerSettings, ControllerSettings, 14
    optional :serverTime, ServerTime, 15
  end

end
