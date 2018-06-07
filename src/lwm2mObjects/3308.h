#pragma once
// Automatically generated header file

#include "lwm2m_objects.hpp"
namespace KnownObjects {
namespace id3308 {
/* \brief Class for object 3308 - Set Point
 *  Description: This IPSO object should be used to set a desired value to a controller,
 *  such as a thermostat. This object enables a setpoint to be expressed units defined in
 *  the UCUM specification, to match an associated sensor or measurement value. A special
 *  resource is added to set the colour of an object.
 */
class instance : public Lwm2mObjectInstance {
public:

    // 5900 - The setpoint value.
    float SetPointValue;
    
    // Optional resource
    // 5701 - If present, the type of sensor defined as the UCUM Unit Definition e.g. “Cel” for Temperature in Celcius.
    PreallocString<30> SensorUnits;
    
    // Optional resource
    // 5706 - A string representing a value in some color space
    PreallocString<30> Colour;
    
    // Optional resource
    // 5750 - The Application type of the device, for example “Motion Closure”.
    PreallocString<30> ApplicationType;
    
    enum class RESID {
        SetPointValue = 5900,
        SensorUnits = 5701,
        Colour = 5706,
        ApplicationType = 5750,
        
    };
};

/* \brief Class for object 3308 - Set Point
 *  Description: This IPSO object should be used to set a desired value to a controller,
 *  such as a thermostat. This object enables a setpoint to be expressed units defined in
 *  the UCUM specification, to match an associated sensor or measurement value. A special
 *  resource is added to set the colour of an object.
 */
class object : public Lwm2mObject<3308, object, instance> {
public:

    // 5900 - The setpoint value.
    Resource(5900, &instance::SetPointValue, O_RES_RW) SetPointValue;
    
    // Optional resource
    // 5701 - If present, the type of sensor defined as the UCUM Unit Definition e.g. “Cel” for Temperature in Celcius.
    Resource(5701, &instance::SensorUnits, O_RES_R) SensorUnits;
    
    // Optional resource
    // 5706 - A string representing a value in some color space
    Resource(5706, &instance::Colour, O_RES_RW) Colour;
    
    // Optional resource
    // 5750 - The Application type of the device, for example “Motion Closure”.
    Resource(5750, &instance::ApplicationType, O_RES_RW) ApplicationType;
    
};

} // end of id namespace
inline bool operator== (id3308::instance::RESID c1, uint16_t c2) { return (uint16_t) c1 == c2; }
inline bool operator== (uint16_t c2, id3308::instance::RESID c1) { return (uint16_t) c1 == c2; }

} // end of KnownObjects namespace
	