package cn.itstudio.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.itstudio.base.DaoSupportImpl;
import cn.itstudio.domain.Company;
import cn.itstudio.service.CompanyService;

@Service
@Transactional
public class CompanyServiceImpl extends DaoSupportImpl<Company> implements CompanyService {


}
